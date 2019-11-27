import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:newbiepets_flutter/models/pet.dart';
import 'package:newbiepets_flutter/services/pet_api_path.dart';

abstract class Database {
  Future<void> setPet(Pet pet);
  Stream<List<Pet>> readPets();
}

String documentIdByDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Stream<List<Pet>> readPets() => _collectionsStream(
      path: APIPath.pets(uid),
      builder: (data, documentId) => Pet.fromMap(data, documentId));

  Future<void> setPet(Pet pet) async => _setData(
        path: APIPath.pet(uid, pet.did),
        data: pet.toMap(),
      );

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
    print('$path : $data');
    await reference.setData(data);
  }

  Stream<List<T>> _collectionsStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentId),
  }) {
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
    snapshots.listen((snapshot) {
      snapshot.documents.forEach((snapshot) => print(snapshot.data));
    });
    return snapshots.map((snapshot) => snapshot.documents
        .map((snapshot) => builder(snapshot.data, snapshot.documentID))
        .toList());
  }
}
