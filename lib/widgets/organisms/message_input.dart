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
      decoration: BoxDecoration(border: Border.all(color: Color(0xCC000000))),
      child: Row(children: [
        Expanded(child: TextField(controller: _controller)),
        RaisedButton(child: Text('Enviar'), onPressed: _sendMessage),
      ]),
    );
  }

  void _sendMessage() {
    widget.onSend(_controller.value.text);
    _controller.clear();
  }
}