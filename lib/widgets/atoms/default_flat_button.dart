import 'package:flutter/material.dart';

class DefaultFlatButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DefaultFlatButton({ this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)
      ),
      onPressed: onPressed,
    );
  }
}
