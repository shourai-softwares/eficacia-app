import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Function onSend;

  MessageInput({ this.onSend });

  @override
  State<StatefulWidget> createState() => MessageInputState();
}

class MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.deepOrangeAccent.shade200)],
        color: Colors.white,
      ),
      child: Row(children: [
        Expanded(child: TextField(controller: _controller)),
        IconButton(icon: Icon(Icons.send, color: Colors.deepOrangeAccent), onPressed: _sendMessage),
      ]),
    );
  }

  void _sendMessage() {
    widget.onSend(_controller.value.text);
    _controller.clear();
  }
}