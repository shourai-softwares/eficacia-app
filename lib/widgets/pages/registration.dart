import 'package:flutter/material.dart';
import 'dashboard.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'titulo',
            ),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            RaisedButton(
              child: Text('Cadastrar'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen())
              ),
            )
          ],
        ),
      ),
    );
  }
}