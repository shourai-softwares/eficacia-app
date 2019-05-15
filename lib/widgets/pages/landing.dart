import 'package:flutter/material.dart';
import 'login.dart';
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen())
                );
              },
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}