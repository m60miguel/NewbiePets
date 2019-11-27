import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/models/user.dart';
import 'package:newbiepets_flutter/pages/mypets.dart';
import 'package:newbiepets_flutter/pages/profileList.dart';
import 'package:newbiepets_flutter/services/auth.dart';
import 'package:newbiepets_flutter/services/userdb.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.auth, this.uid});
  final Auth auth;
  final String uid;

  static Future<void> show(BuildContext context,
      {Auth auth, String uid}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(auth: auth, uid: uid),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  Profile _profile;

  @override
  void initState() {
    final database = FirestoreUserDatabase(uid: widget.uid);
    database.readUser().then((user) {
      setState(() {
        print(user.toString());
        _profile = user;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String uid1;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 32),
              onPressed: () => Navigator.pop(context)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, color: Colors.white, size: 32),
              onPressed: () => {},
            )
          ],
          expandedHeight: 220.0,
          floating: true,
          pinned: true,
          snap: true,
          elevation: 50,
          backgroundColor: Colors.deepPurple,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Mi Perfil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  )),
              background: Image.network(
                'https://picsum.photos/id/251/640/480',
                fit: BoxFit.cover,
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _buildList(context, widget.uid, _profile),
        ])),
        SliverList(
          delegate: SliverChildListDelegate([
            MaterialButton(
              height: 50,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.pets),
                  Text(
                    '    Mis Mascotas    ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.pets),
                ],
              ),
              onPressed: () async => {
                uid1 = await widget.auth.currentUser(),
                print(uid1),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPetPage(
                              auth: widget.auth,
                              uid: uid1,
                            )))
              },
            ),
          ]),
        )
      ],
    ));
  }

  _buildList(BuildContext context, String uid, Profile profile) {
    try {
      print('Perfil ' + profile.toString());
      return ProfileList(
        profile: profile,
      );
    } catch (e) {
      return Center(child: CircularProgressIndicator());
    }
  }
}
