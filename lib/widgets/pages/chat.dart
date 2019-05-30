import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import '../organisms/message_list.dart';
import '../organisms/message_input.dart';
import '../../state/AuthModel.dart';

class ChatScreen extends StatelessWidget {
  final DocumentReference chatRef;

  ChatScreen({ this.chatRef });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
      ),
      body: Column(
        children: [
          Expanded(child: MessageList(chatRef: chatRef)),
          ScopedModelDescendant<AuthModel>(
            builder: (context, child, model) =>
              MessageInput(onSend: (msg) => _sendMessage(msg, model.user.uid)),
          ),
        ]
      ),
    );
  }

  void _sendMessage(String newMessage, String uid) {
    final newMessageMap = Map<String, dynamic>();

    newMessageMap['content'] = newMessage;
    newMessageMap['sentBy'] = uid;

    chatRef.updateData(<String, dynamic> {
      'messages': FieldValue.arrayUnion([newMessageMap]),
    });
  }
}