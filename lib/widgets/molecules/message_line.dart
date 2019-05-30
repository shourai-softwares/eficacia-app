import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../state/AuthModel.dart';
import '../atoms/bubble.dart';

class MessageLine extends StatelessWidget {
  final message;

  MessageLine(this.message);

  @override
  Widget build(BuildContext context) {
    final sentBy = message['sentBy'];

    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        final sentByMe = (sentBy == model.user.uid);
        final align = sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start;
        return Row(
          mainAxisAlignment: align,
          children: [
            Bubble(
                message: message['content'],
                delivered: true,
                isMe: sentByMe,
                time: 'alala'
            ),
          ]
        );
      },
    );
  }
}