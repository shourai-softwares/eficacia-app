import 'package:flutter/material.dart';
import '../organisms/ticket_card.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        TicketCard(),
        TicketCard(),
        TicketCard(),
        TicketCard(),
        TicketCard(),
      ],
    );
  }
}