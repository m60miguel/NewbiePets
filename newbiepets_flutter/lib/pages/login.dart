import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/pages/register.dart';
import 'package:newbiepets_flutter/pages/registerpet.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 400));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceIn);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
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
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration:
                            new InputDecoration(hintText: "Correo electrónico"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(hintText: "Contraseña"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Iniciar Sesión"),
                        onPressed: _signInAnonymously,
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
                        textColor: Colors.white,
                        color: Color(0xFF334092),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('images/facebook-logo.png'),
                              Text("Iniciar con Facebook"),
                              Opacity(
                                opacity: 0.0,
                                child: Image.asset('images/facebook-logo.png'),
                              )
                            ]),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        onPressed: () => {},
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        child: new Text("Registrarse"),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistroPage()))
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Registrar Mascota"),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistroPetPage()))
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}

class User {
  User({@required this.uid});
  final String uid;
}

void _signInAnonymously() async {
  try {
    FirebaseUser user = (await FirebaseAuth.instance.signInAnonymously()).user;
    print('${user.uid}');
  } catch (e) {
    print(e); // TODO: show dialog with error
  }
}

void _signInWithGoogle() async {
  try {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    print('${googleUser.displayName}');
  } catch (e) {
    print(e); // TODO: show dialog with error
  }
}
