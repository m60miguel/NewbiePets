import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newbiepets_flutter/pages/register.dart';

import 'package:newbiepets_flutter/services/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final Auth auth;
  final VoidCallback onSignedIn;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = new GlobalKey<FormState>();
    String _email;
    String _password;

    bool validateForm() {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    void _submit() async {
      if (validateForm()) {
        try {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Login by $userId');
          widget.onSignedIn();
        } catch (e) {
          print('Error: $e');
        }
      }
    }

    void _signInWithGoogle() async {
      try {
        await widget.auth.signInWithGoogle();
        widget.onSignedIn();
      } on PlatformException catch (e) {
        print(e);
      }
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text("Iniciar Sesión"),
          actions: <Widget>[],
        ),
        body: new Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100,
              ),
              new Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration:
                            new InputDecoration(hintText: "Correo electrónico"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value.isNotEmpty
                            ? null
                            : 'Email no debe estar Vacio',
                        onSaved: (value) => _email = value,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(hintText: "Contraseña"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) => value.isNotEmpty
                            ? null
                            : 'Password no debe estar Vacio',
                        onSaved: (value) => _password = value,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.check),
                            Text(
                              ' Ingresar',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onPressed: _submit,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                        color: Colors.white,
                        textColor: Colors.black87,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('images/google-logo.png'),
                              Text("Iniciar con Google"),
                              Opacity(
                                opacity: 0.0,
                                child: Image.asset('images/google-logo.png'),
                              )
                            ]),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        onPressed: _signInWithGoogle,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          child: new Text("Registrarse"),
                          onPressed: () =>
                              RegistroPage.show(context, auth: new Auth())),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
