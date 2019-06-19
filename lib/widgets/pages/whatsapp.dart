import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../atoms/default_button.dart';

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}

class Whatsapp extends StatelessWidget {
  final DocumentSnapshot profile;

  Whatsapp({ this.profile });

  @override
  Widget build(BuildContext context) {
    _openWhatsapp(context);

    final logoffButton = CustomPopupMenu(title: 'Logoff', icon: Icons.power_settings_new);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          PopupMenuButton<CustomPopupMenu>(
              onSelected: (CustomPopupMenu choice) => FirebaseAuth.instance.signOut(),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<CustomPopupMenu>(
                  value: logoffButton,
                  child: Text(logoffButton.title),
                ),
              ],
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 150, 20, 10),
          child: Column(
            children: [
              Text(
                'Clique no botão abaixo e estaremos prontos para te atender!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              DefaultButton(
                text: 'Abrir WhatsApp',
                onPressed: () => _openWhatsapp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openWhatsapp(BuildContext context) async {
    final name = profile.data['name'];
    final service = profile.data['service'];

    final phone = '+5521979840031';
    final message = 'Olá Fabiano, sou *$name*. Me cadastrei no seu aplicativo e gostaria de conversar sobre *$service*';
    final whatsappUrl ='whatsapp://send?phone=$phone&text=$message';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      final snackBar = SnackBar(
        content: Text('Não foi possível abrir o Whatsapp!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}