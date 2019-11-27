import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';
import 'package:newbiepets_flutter/services/auth.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({this.auth, this.onSignedIn});
  final Auth auth;
  final VoidCallback onSignedIn;

  static Future<void> show(BuildContext context, {Auth auth}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegistroPage(auth: auth),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  RegistroPageState createState() => RegistroPageState();
}

class RegistroPageState extends State<RegistroPage> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _cpassword;
  String _nombre;
  String _telefono;
  String _direccion;
  var _registerPassController = TextEditingController();
  var _registerPassController2 = TextEditingController();

  bool validateForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
      //print('Bienvenido Email: $_email & $_password');
    } else {
      return false;
    }
  }

  void _submit() async {
    if (validateForm()) {
      try {
        String userId =
            await widget.auth.createUserWithEmailAndPassword(_email, _password);
        Firestore.instance.collection("Users").document(userId).setData({
          "email": _email,
          "nombre": _nombre,
          "telefono": _telefono,
          "direccion": _direccion,
        });
        print('Created by $userId');
        PlatformAlertDialog(
          title: 'Exito!',
          content: 'Se ha registrado correctamente. \n$_nombre',
          defaultActionText: 'Ok',
        ).show(context);
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Registro usuario"),
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
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("Datos de Inicio",
                                style: TextStyle(fontSize: 20.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                  hintText: "Correo electrónico"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => value.isNotEmpty
                                  ? null
                                  : 'Email no debe estar Vacio',
                              onSaved: (value) => _email = value,
                            ),
                            new TextFormField(
                              controller: _registerPassController,
                              decoration:
                                  new InputDecoration(hintText: "Contraseña"),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (value) => value.isNotEmpty
                                  ? null
                                  : 'Password no debe estar Vacio',
                              onSaved: (value) => _password = value,
                            ),
                            new TextFormField(
                                controller: _registerPassController2,
                                decoration: new InputDecoration(
                                    hintText: "Repetir Contraseña"),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) {
                                  if (value != _registerPassController.text) {
                                    return 'Password is not matching';
                                  }
                                }),
                            new Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                            ),
                            new Text("Datos Personales",
                                style: TextStyle(fontSize: 20.0)),
                            new TextFormField(
                              decoration:
                                  new InputDecoration(hintText: "Nombre"),
                              keyboardType: TextInputType.text,
                              validator: (value) => value.isNotEmpty
                                  ? null
                                  : 'Nombre no debe estar Vacio',
                              onSaved: (value) => _nombre = value,
                            ),
                            new TextFormField(
                              decoration:
                                  new InputDecoration(hintText: "Telefono"),
                              keyboardType: TextInputType.number,
                              onSaved: (value) => _telefono = value,
                            ),
                            new TextFormField(
                              decoration:
                                  new InputDecoration(hintText: "Dirección"),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _direccion = value,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                            ),
                            new MaterialButton(
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Registrarse"),
                              onPressed: _submit,
                            ),
                            new MaterialButton(
                              color: Colors.red,
                              textColor: Colors.white,
                              child: new Text("Cancelar"),
                              onPressed: () => {Navigator.pop(context)},
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
