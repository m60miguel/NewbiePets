import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/root.dart';
import 'package:newbiepets_flutter/services/auth.dart';
import 'package:provider/provider.dart';
import 'root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      builder: (context) => Auth(),
      child: MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.deepPurple),
        home: new RootPage(auth: new Auth()),
      ),
    );
  }
}
