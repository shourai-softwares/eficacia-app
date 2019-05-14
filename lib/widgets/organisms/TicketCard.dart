import 'package:flutter/material.dart';
import '../pages/chat.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        child: Column(
          children: [
            Text('Entry A'),
            FlatButton(
              child: Text('Click'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen())
              ),
            ),
          ]
        ),
      ),
    );
  }
}