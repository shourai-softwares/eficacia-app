import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        child: const Center(child: Text('Entry A')),
      ),
    );
  }
}