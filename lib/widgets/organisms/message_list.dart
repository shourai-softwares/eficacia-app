import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../molecules/message_line.dart';

class MessageList extends StatelessWidget {
  final DocumentReference chatRef;
  final ScrollController controller;

  MessageList({ this.chatRef, this.controller });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: StreamBuilder<DocumentSnapshot>(
        stream: chatRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: Text('loading'));
            default:
              List<dynamic> messages = snapshot.data.data['messages'];
              return ListView(
                controller: controller,
                shrinkWrap: true,
                reverse: true,
                children: messages.reversed.map((message) => MessageLine(message)).toList(),
              );
          }
        }
      ),
    );
  }
}