import 'package:flutter/material.dart';
import '../pages/chat.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 3.0, color: Color(0xFF66CC66)))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FlutterLogo(size: 50),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('serviço'),
              Text('nome'),
            ],
          )),
          Column(children: [
            Text('status'),
            FlatButton(
              child: Text('Click'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen())
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
