import 'package:flutter/material.dart';

class DogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Perros"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListDogs(imageDog: "akita.jpg", nameDog: "Akita"),
          new ListDogs(imageDog: "alaskan-malamute.jpg", nameDog: "Alaskan Malamute"),
          new ListDogs(imageDog: "beagle.jpg", nameDog: "Beagle")
        ],
      ),
    );
  }
}

class ListDogs extends StatelessWidget {

  ListDogs ({this.imageDog, this.nameDog});

  final String imageDog;
  final String nameDog;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset('images/dogs/'+imageDog, width: 200.0),
            new Text(nameDog, style: new TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
