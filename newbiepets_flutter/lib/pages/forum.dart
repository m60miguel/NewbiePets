import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => new _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  /// Top Icons
  var topCategoyIcons = new Container(
    alignment: Alignment.center,
    decoration: new BoxDecoration(
        gradient: new LinearGradient(
      colors: [Colors.white, Colors.blue],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
    child: new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        // border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(30.0),
          topRight: new Radius.circular(30.0),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new CategoryIcon(Icons.landscape, "Nature", true),
          new CategoryIcon(Icons.headset, "Music", false),
          new CategoryIcon(Icons.movie, "Movies", false),
          new CategoryIcon(Icons.place, "Places", false),
        ],
      ),
    ),
  );

  var categoryMetric = new Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [Colors.white, Colors.blue],
        begin: const FractionalOffset(0.0, 0.5),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      // border: new Border.all(color: Colors.black, width: 1.0),
      borderRadius: new BorderRadius.only(
        bottomLeft: new Radius.circular(30.0),
        bottomRight: new Radius.circular(30.0),
      ),
    ),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CategoryIcon(Icons.cake, "Food", false),
        new CategoryIcon(Icons.book, "Book", false),
        new CategoryIcon(Icons.games, "Games", false),
        new CategoryIcon(Icons.history, "History", false),
      ],
    ),
  );

  static final listItemsData = [
    new ListEntry("Forum 1", "test", "description 1", 54, 2, true),
    new ListEntry("Forum 2", "test", "description 2", 154, 3, false),
  ];
  var listView = new ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        new EntryItem(listItemsData[index]),
    itemCount: listItemsData.length,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Foro"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () => {}),
        ],
      ),
      body: new Container(
        child: new Column(
        children: <Widget>[topCategoyIcons, categoryMetric],
        //children: <Widget>[topCategoyIcons, categoryMetric, listView],          
        ),
      ),
    );
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses,
      this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon),
            onPressed: () => {},
            color: selected == true ? Colors.blue : Colors.black,
          ),
          new Text(iconText)
        ],
      ),
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: new BoxDecoration(
        color: Colors.blue,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: new ListTile(
        title: new Text(entry.title),
        subtitle: new Text(entry.description),
        leading: new Icon(Icons.dashboard, color: Colors.white),
        trailing: new Row(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            new CategoryIcon(
                Icons.remove_red_eye, entry.views.toString(), false),
            new CategoryIcon(Icons.comment, entry.responses.toString(), false),
          ],
        ),
        onTap: ()=>{},
      ),
    );
  }
}
