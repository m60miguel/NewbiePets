import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/pages/login.dart';

class RegistroPetPage extends StatefulWidget {
  RegistroPetPage({Key key}) : super(key: key);

  RegistroPetPageState createState() => RegistroPetPageState();
}

class RegistroPetPageState extends State<RegistroPetPage> {
  List _mascotas = [
    'Perro',
    'Gato',
    'Hamster',
    'Minipig',
    'Serpiente',
    'Arañas'
  ];

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
        title: Text("Registrar Mascota"),
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
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(hintText: "Edad"),
                            keyboardType: TextInputType.number,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                hintText: "Fecha de Nacimiento"),
                            keyboardType: TextInputType.datetime,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                          ),
                          new Text("Tipo", style: TextStyle(fontSize: 15.0)),
                          new DropdownButton(
                            value: _mascotasActual,
                            items: _dropDownMenuItems,
                            onChanged: changedDropDownItem,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                          ),
                          new MaterialButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Registrarte"),
                            onPressed: () => {},
                          ),
                          new MaterialButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text("Cancelar"),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()))
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
}
