import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import './widgets/pages/dashboard.dart';
import './widgets/pages/landing.dart';

void main() => runApp(MyApp());

enum AuthStatus { UNKNOWN, AUTHENTICATED, UNAUTHENTICATED }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthStatus status = AuthStatus.UNKNOWN;

  @override
  void initState() {
    super.initState();

    auth.onAuthStateChanged.listen((firebaseUser) {
      debugPrint('fbUser: $firebaseUser');
      setState(() {
        if (firebaseUser == null) {
          status = AuthStatus.UNAUTHENTICATED;
        } else {
          status = AuthStatus.AUTHENTICATED;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eficacia Contabilidade',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: getCurrentArea(),
    );
  }

  Widget getCurrentArea() {
    Widget screen;

    switch (status) {
      case AuthStatus.UNKNOWN:
        screen = Text('un');
        break;
      case AuthStatus.AUTHENTICATED:
        screen = DashboardScreen();
        break;
      case AuthStatus.UNAUTHENTICATED:
        screen = LandingScreen();
        break;
    }

    return screen;
  }
}