import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../pages/chat.dart';

class TicketCard extends StatelessWidget {
  final DocumentSnapshot ticket;

  TicketCard({ this.ticket });

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 3.0, color: Color(0xFF66CC66)))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ticket.data['service']),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  ticket.data['client']['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(ticket.data['client']['phone']),
              ),
            ],
          )),
          Column(children: [
            FlatButton(
              child: Text('Abrir Chat', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 14)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(chatRef: ticket.reference,))
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
