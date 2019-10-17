import 'package:flutter/material.dart';

class CatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gatos"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListCats(imageCat: "american-shorthair.jpg", nameCat: "American Shorthair"),
          new ListCats(imageCat: "bombay.jpg", nameCat: "Bombay"),
          new ListCats(imageCat: "korat.jpg", nameCat: "Korat")
        ],
      ),
    );
  }
}

class ListCats extends StatelessWidget {

  ListCats ({this.imageCat, this.nameCat});

  final String imageCat;
  final String nameCat;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset('images/cats/'+imageCat, width: 200.0),
            new Text(nameCat, style: new TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
