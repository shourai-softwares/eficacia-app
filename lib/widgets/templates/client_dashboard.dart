import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../organisms/ticket_card.dart';
import '../pages/registration.dart';
import '../pages/whatsapp.dart';
import '../../state/AuthModel.dart';

class ClientDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        if (model.profile.data.containsKey('phone') && model.profile.data['phone'] != null) {
          return Whatsapp(profile: model.profile);
        } else {
          return RegistrationScreen();
        }
      },
    );
  }

  Widget _showDashboard() {
    return Scaffold(
      appBar: AppBar(title: Text('Tickets')),
      body: Center(child: Column(children: <Widget>[
        Card(child: Row(children: <Widget>[
          Text('Imagem'),
          Column(children: <Widget>[
            Text('titulo'),
            Text('titulo'),
            Text('titulo'),
          ]),
        ])),
        TicketCard(),
        TicketCard(),
      ])),
    );
  }
}