import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:newbiepets_flutter/models/user.dart';
import 'package:newbiepets_flutter/services/user_api_path.dart';

abstract class DatabaseUser {
  Future<Profile> readUser();
}

String documentIdByDate() => DateTime.now().toIso8601String();

class FirestoreUserDatabase implements DatabaseUser {
  FirestoreUserDatabase({@required this.uid}) : assert(uid != null);

  final String uid;

  Future<Profile> readUser() async {
    final path = APIPathUser.user(uid);
    print(path);
    var reference = await Firestore.instance.document(path).get();
    return Profile.fromMap(reference.data, reference.documentID);

    /*return snapshots.map((snapshot) => snapshot.data.map(
          (snapshot) => Profile(
            nombre: snapshot.data['nombre'],
            email: snapshot.data['email'],
            direccion: snapshot.data['direccion'],
            telefono: snapshot.data['telefono'],
          ),
        ));*/
  }
/*
  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
    print('$path : $data');
    await reference.setData(data);
  }*/
}
