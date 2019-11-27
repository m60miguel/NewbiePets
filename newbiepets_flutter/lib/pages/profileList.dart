import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/models/user.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key key, @required this.profile}) : super(key: key);
  final Profile profile;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: new Center(child: new Text(profile.nombre)),
          subtitle: new Center(child: new Text('Nombre')),
        ),
        ListTile(
          title: new Center(child: new Text(profile.email)),
          subtitle: new Center(child: new Text('Email')),
        ),
        ListTile(
          title: new Center(
              child: new Text(
                  profile.direccion != null ? profile.direccion : 'Pendiente')),
          subtitle: new Center(child: new Text('Direccion')),
        ),
        ListTile(
          title: new Center(
              child: new Text(
                  profile.telefono != null ? profile.telefono : 'Pendiente')),
          subtitle: new Center(child: new Text('Telefono')),
        ),
      ],
    );
  }
}
