import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './widgets/molecules/loading_screen.dart';
import './widgets/pages/dashboard.dart';
import './widgets/pages/landing.dart';
import './state/AuthModel.dart';

void main() => runApp(MyApp());

enum AuthStatus { UNKNOWN, AUTHENTICATED, UNAUTHENTICATED }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final AuthModel authModel = AuthModel();
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthStatus status = AuthStatus.UNKNOWN;

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  @override
  void initState() {
    super.initState();

    firebaseCloudMessagingListeners();

    auth.onAuthStateChanged.listen((firebaseUser) {
      setState(() {
        if (firebaseUser == null) {
          status = AuthStatus.UNAUTHENTICATED;
        } else {
          status = AuthStatus.AUTHENTICATED;
          authModel.setUser(firebaseUser);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: authModel,
      child: MaterialApp(
        title: 'Eficacia Contabilidade',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: getCurrentArea(),
      ),
    );
  }

  Widget getCurrentArea() {
    Widget screen;

    switch (status) {
      case AuthStatus.UNKNOWN:
        screen = LoadingScreen();
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