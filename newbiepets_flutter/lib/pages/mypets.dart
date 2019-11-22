import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';
import 'package:newbiepets_flutter/models/pet.dart';
import 'package:newbiepets_flutter/services/petdb.dart';

class MyPetPage extends StatefulWidget {
  MyPetPage({Key key}) : super(key: key);

  @override
  MyPetPageState createState() => MyPetPageState();
}

class MyPetPageState extends State<MyPetPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Mascotas"),
        actions: <Widget>[],
      ),
      body: _buildContents(context),
    );
  }

  _buildContents(BuildContext context) {
    final database = FirestoreDatabase(uid: 'null');
    return StreamBuilder<List<Pet>>(
        stream: database.readPets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pets = snapshot.data;
            final nombre1 = pets.map((pet) => Text(pet.nombre)).toList();
            final edad1 = pets.map((pet) => (pet.edad)).toList();
            final fechaNacimiento1 = pets.map((pet) => (pet.fechaNacimiento)).toList();
            final tipo1 = pets.map((pet) => Text(pet.tipo)).toList();
            return ListView(children:  <Widget>[
                  Card(
                      child: ListTile(
                          title: new Text(nombre1.toString()),
                          subtitle: new Text(edad1.toString()),
                          isThreeLine: true,
                      ),
                  )
            ]);
          }
          if (snapshot.hasError) {
            PlatformAlertDialog(
              title: 'Ups!',
              content: 'Ha ocurrido un error',
              defaultActionText: 'Ok',
            ).show(context);
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
