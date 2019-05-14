import 'package:flutter/material.dart';
import '../atoms/bubble.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Bubble(message: 'teste\nrwa', time: 'today', delivered: true, isMe: true),
              Bubble(message: 'teste', time: 'today', delivered: true, isMe: false),
              Bubble(message: 'teste', time: 'today', delivered: true, isMe: true),
              Bubble(message: 'teste', time: 'today', delivered: true, isMe: false),
              Bubble(message: 'teste', time: 'today', delivered: true, isMe: true),
            ],
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Please enter a search term'
            ),
          ),
        ]
      ),
    );
  }
}