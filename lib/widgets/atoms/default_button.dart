import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DefaultButton({ this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: Colors.deepOrange,
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0, color: Colors.white)
        ),
        onPressed: onPressed,
      )
    );
  }
}
