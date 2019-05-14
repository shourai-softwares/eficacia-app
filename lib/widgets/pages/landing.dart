import 'package:flutter/material.dart';
import 'dashboard.dart';

class LandingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('landing'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'titulo',
            ),
            FlutterLogo(),
            Text(
              'texto',
            ),
            RaisedButton(
              child: Text('Teste'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen())
                );
              },
            ),
            RaisedButton(
              child: Text('Teste'),
            ),
          ],
        ),
      ),
    );
  }
}