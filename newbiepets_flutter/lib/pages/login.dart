import 'package:flutter/material.dart';

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
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Column(
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
                      decoration: new InputDecoration(hintText: "E-mail"),
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
                      child: new Text("LogIn"),
                      onPressed: () => {},
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                    ),
                    new MaterialButton(
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      child: new Text("Registrarse"),
                      onPressed: () => {},
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
