import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newbiepets_flutter/pages/maps.dart';
import 'package:newbiepets_flutter/pages/profile.dart';
import 'package:newbiepets_flutter/pages/settings.dart';
import 'package:newbiepets_flutter/pages/pets.dart';
import 'package:newbiepets_flutter/pages/login.dart';
import 'package:newbiepets_flutter/pages/forum.dart';
import 'package:newbiepets_flutter/services/auth.dart';

class HomePage extends StatelessWidget {
  String uid1;

  HomePage({this.auth, this.onSignOut});
  final Auth auth;
  final VoidCallback onSignOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NewbiePets App"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Mi Nombre"),
                accountEmail: new Text("Mis Datos"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: new Icon(Icons.account_circle),
                ),
                onDetailsPressed: () async => {
                      uid1 = await auth.currentUser(),
                      ProfilePage.show(context, auth: auth, uid: uid1),
                    }),
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
                }),
            new ListTile(
              title: new Text("Salir"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: _signOut,
            ),
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
