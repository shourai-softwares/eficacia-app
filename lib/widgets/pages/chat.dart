import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('chats').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Center(child: Text('loading'));
                default:
                  return new Column(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                      return Bubble(message: 'teste\nrwa', time: 'today', delivered: true, isMe: true);
                    }).toList(),
                  );
              }
            }
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