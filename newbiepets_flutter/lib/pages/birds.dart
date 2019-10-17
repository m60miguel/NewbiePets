import 'package:flutter/material.dart';

class BirdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Aves"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListBirds(imageBird: "adult-gouldian-finch.jpg", nameBird: "Adult Gouldian Finch"),
          new ListBirds(imageBird: "brotogeris-parrot.jpg", nameBird: "Brotogeris Parrot"),
          new ListBirds(imageBird: "yellow-canary.jpg", nameBird: "Yellow Canary")
        ],
      ),
    );
  }
}

class ListBirds extends StatelessWidget {

  ListBirds ({this.imageBird, this.nameBird});

  final String imageBird;
  final String nameBird;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset('images/birds/'+imageBird, width: 200.0),
            new Text(nameBird, style: new TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
