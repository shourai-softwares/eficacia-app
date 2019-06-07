import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../organisms/ticket_card.dart';

class CardList extends StatelessWidget {
  final List<DocumentSnapshot> cards;

  CardList({ this.cards });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: cards.map((card) => TicketCard(ticket: card)).toList(),
    );
  }
}