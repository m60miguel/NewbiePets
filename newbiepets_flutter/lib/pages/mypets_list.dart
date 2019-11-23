import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newbiepets_flutter/models/pet.dart';

class MyPetsList extends StatelessWidget {
  const MyPetsList({Key key, @required this.pet, this.onTap}) : super(key: key);
  final Pet pet;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Card(
                  child: ListTile(
                title: Text(pet.nombre.toString()),
                subtitle: Text(new DateFormat("dd-MM-yyyy")
                    .format(pet.fechaNacimiento.toDate())),
                dense: true,
                trailing: Icon(Icons.edit),
                onTap: onTap,
              ))
            ])));
  }
}
