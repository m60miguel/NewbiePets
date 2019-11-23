import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/pages/registerpet.dart';
import 'package:newbiepets_flutter/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:newbiepets_flutter/pages/maps.dart';
import 'package:newbiepets_flutter/pages/settings.dart';
import 'package:newbiepets_flutter/pages/pets.dart';
import 'package:newbiepets_flutter/pages/login.dart';
import 'package:newbiepets_flutter/pages/forum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      builder: (context) => Auth(),
      child: MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.deepPurple),
        home: new HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NewbiePets App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Juan Dominguez"),
              accountEmail: new Text("jdominguez@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: new Icon(Icons.account_circle),
              ),
              onDetailsPressed: () => RegistroPetPage.show(context),
            ),
            new ListTile(
                title: new Text("Mascotas"),
                trailing: new Icon(Icons.pets),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PetsPage()),
                  );
                }),
            new ListTile(
                title: new Text("Mapa"),
                trailing: new Icon(Icons.map),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapsPage()),
                  );
                }),
            new Divider(),
            new ListTile(
              title: new Text("Acerca de"),
              trailing: new Icon(Icons.info),
            ),
            new Divider(),
            new ListTile(
                title: new Text("Iniciar Sesión"),
                trailing: new Icon(Icons.verified_user),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }),
            new ListTile(
                title: new Text("Foro"),
                trailing: new Icon(Icons.view_list),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForumPage()),
                  );
                }),
            new ListTile(
                title: new Text("Ajustes"),
                trailing: new Icon(Icons.settings_applications),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                })
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new PetsPage(),
        ),
      ),
    );
  }
}
