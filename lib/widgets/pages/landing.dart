import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'registration.dart';

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
              child: Text('Cadastre-se'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen())
                );
              },
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}