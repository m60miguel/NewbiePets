import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  ForumPage({Key key}) : super(key: key);

  ForumPageState createState() => ForumPageState();
}

class ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Foro"),
          actions: <Widget>[],
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://pngimg.com/uploads/cat/cat_PNG50485.png'),
                        backgroundColor: Colors.transparent),
                    title: new Text("Foro 1"),
                    subtitle: new Text(
                        "#53 ... Si el texto es bastante extenso hará las tres lineas"),
                    dense: true,
                    trailing: Icon(Icons.more_vert),
                    onTap: () => {},
                    onLongPress: () => {},
                  ))
                ]))));
  }
}
