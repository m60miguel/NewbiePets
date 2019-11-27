import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';
import 'package:newbiepets_flutter/models/pet.dart';
import 'package:newbiepets_flutter/pages/mypets_list.dart';
import 'package:newbiepets_flutter/pages/registerpet.dart';
import 'package:newbiepets_flutter/services/auth.dart';
import 'package:newbiepets_flutter/services/petdb.dart';

class MyPetPage extends StatefulWidget {
  MyPetPage({this.auth, this.uid});
  final Auth auth;
  final String uid;

  @override
  MyPetPageState createState() => MyPetPageState();
}

class MyPetPageState extends State<MyPetPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Mascotas"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () =>
                    RegistroPetPage.show(context, auth: widget.auth))
          ],
        ),
        body: _buildContents(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed: () => RegistroPetPage.show(context, auth: widget.auth),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  _buildContents(BuildContext context) {
    final database = FirestoreDatabase(uid: widget.uid);
    return StreamBuilder<List<Pet>>(
        stream: database.readPets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pets = snapshot.data;
            final children = pets
                .map((pet) => MyPetsList(
                      pet: pet,
                      onTap: () => RegistroPetPage.show(context,
                          auth: widget.auth, pet: pet),
                    ))
                .toList();
            return ListView(children: children);
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
