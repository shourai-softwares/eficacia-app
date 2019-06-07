import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';
import '../organisms/message_list.dart';
import '../organisms/message_input.dart';
import '../../state/AuthModel.dart';

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}

class ChatScreen extends StatelessWidget {
  final DocumentReference chatRef;
  final ScrollController _scrollController = new ScrollController();

  ChatScreen({ this.chatRef });

  @override
  Widget build(BuildContext context) {
    final logoffButton = CustomPopupMenu(title: 'Logoff', icon: Icons.power_settings_new);
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        actions: [
          PopupMenuButton<CustomPopupMenu>(
              onSelected: (CustomPopupMenu choice) => FirebaseAuth.instance.signOut(),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<CustomPopupMenu>(
                  value: logoffButton,
                  child: Text(logoffButton.title),
                ),
              ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: MessageList(controller: _scrollController,chatRef: chatRef)),
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
    newMessageMap['sentOn'] = DateFormat('HH:mm dd/MM').format(DateTime.now());

    chatRef.updateData(<String, dynamic> {
      'messages': FieldValue.arrayUnion([newMessageMap]),
    });
    _scrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}