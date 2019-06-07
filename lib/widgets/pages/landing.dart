import 'package:flutter/material.dart';
import '../atoms/default_button.dart';
import 'auth.dart';

class LandingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
          ),
          Container(color: Color.fromARGB(100, 0, 0, 0),),
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 75, 0, 20),
                  child: Text(
                    'Eficácia Contabilidade',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      shadows: [
                        Shadow(blurRadius: 5),
                      ],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
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
        ],
      ),
    );
  }
}