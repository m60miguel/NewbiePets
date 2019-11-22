import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';
import 'package:newbiepets_flutter/commonwidgets/platform_exception.dart';
import 'package:newbiepets_flutter/models/pet.dart';
import 'package:newbiepets_flutter/pages/mypets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newbiepets_flutter/services/petdb.dart';

class RegistroPetPage extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegistroPetPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  RegistroPetPageState createState() => RegistroPetPageState();
}

class RegistroPetPageState extends State<RegistroPetPage> {
  String _nombre;
  int _edad;
  DateTime _fechaNacimiento;
  String _tipo;
  var dateTXT = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async{
    if (_validateForm()) {
      final database = FirestoreDatabase(uid: 'null');
      final pet = Pet(nombre: _nombre, edad: _edad, fechaNacimiento: Timestamp.fromDate(_fechaNacimiento), tipo: _tipo);
      await database.createPet(pet);
      PlatformAlertDialog(
        title: 'Exito!',
        content: 'Se ha guardado correctamente. \n nombre: $_nombre - $_edad  años \n $_fechaNacimiento, y $_tipo',
        defaultActionText: 'Ok',
      ).show(context);
      
    }
  }

  List _mascotas = ['Perro', 'Gato', 'Canario', 'Loro', 'Gorrión'];

  DateTime selectedDate = DateTime.now();

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _mascotasActual;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _mascotasActual = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String mascota in _mascotas) {
      items.add(new DropdownMenuItem(value: mascota, child: new Text(mascota)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Registro Mascota"),
        actions: <Widget>[],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(50.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text("Datos De Mascota",
                              style: TextStyle(fontSize: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(hintText: "Nombre"),
                            keyboardType: TextInputType.text,
                            validator: (value) => value.isNotEmpty ? null: 'Nombre no debe estar Vacio',
                            onSaved: (value) => _nombre = value,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(hintText: "Edad"),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: false),
                             validator: (value) => value.isNotEmpty ? null: 'Edad no debe estar Vacio',
                            onSaved: (value) =>
                                _edad = int.tryParse(value) ?? 0,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                hintText: "Fecha de Nacimiento"),
                            keyboardType: TextInputType.datetime,
                            readOnly: true,
                            controller: dateTXT,
                             validator: (value) => value.isNotEmpty ? null: 'Fecha Nacimiento no debe estar Vacio',
                            onSaved: (value) =>
                                _fechaNacimiento = DateTime.parse(value),
                          ),
                          Text("${selectedDate.toLocal()}"),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Seleccionar fecha'),
                          ),
                          RaisedButton(
                            onPressed: () =>
                                {dateTXT.text = ("${selectedDate.toLocal()}")},
                            child: Text('Actualizar fecha'),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                          ),
                          new Text("Tipo", style: TextStyle(fontSize: 15.0)),
                          new DropdownButton(
                              hint: new Text('Seleccione Animal'),
                              value: _mascotasActual,
                              items: _dropDownMenuItems,
                              onChanged: (String mascotaSelec) {
                                setState(() {
                                  _mascotasActual = mascotaSelec;
                                  _tipo = mascotaSelec;
                                });
                              }),
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                          ),
                          new MaterialButton(
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                ),
                                Text('Registrar'),
                              ],
                            ),
                            onPressed: _submit,
                            //onPressed: () => _createPet(context),
                          ),
                          new MaterialButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text("Cancelar"),
                            onPressed: () => {Navigator.pop(context)},
                          ),
                          new MaterialButton(
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: new Text("Database"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPetPage()))
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  void changedDropDownItem(String mascotaSelec) {
    setState(() {
      _mascotasActual = mascotaSelec;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _createPet(BuildContext context) async {
    try {
      var tiempo = DateTime.parse("1969-07-20 20:18:04Z");
      final database = FirestoreDatabase(uid: 'null');
      await database.createPet(Pet(
        nombre: 'Noche1',
        edad: 1,
        fechaNacimiento: Timestamp.fromDate(tiempo),
        tipo: 'Gato',
      ));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Error en la Operación',
        exception: e,
      ).show(context);
    }
  }
}
