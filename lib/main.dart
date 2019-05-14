import 'package:flutter/material.dart';
import 'package:eficacia_app/widgets/pages/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eficacia Contabilidade',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LandingScreen(),
    );
  }
}