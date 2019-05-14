import 'package:flutter/material.dart';
import '../organisms/ticket_card.dart';

class ClientDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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