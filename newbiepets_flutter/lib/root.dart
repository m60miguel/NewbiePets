import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/home.dart';
import 'package:newbiepets_flutter/pages/login.dart';
import 'package:newbiepets_flutter/services/auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final Auth auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus { notSigned, Signed }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSigned;

  @override
  void initState() {
    widget.auth.currentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSigned : AuthStatus.Signed;
      });
    });
    super.initState();
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.Signed;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSigned:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.Signed:
        return new HomePage(
          auth: widget.auth,
          onSignOut: _signedOut,
        );
    }
  }
}
