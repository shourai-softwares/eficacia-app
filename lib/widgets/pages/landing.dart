import 'package:flutter/material.dart';
import '../atoms/default_button.dart';
import 'auth.dart';

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
            DefaultButton(
              text: 'Cadastre-se',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen(mode: FormMode.SIGNUP))
                );
              },
            ),
            DefaultButton(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen(mode: FormMode.LOGIN))
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}