import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  static const NORMAL = 'normal';
  static const FACEBOOK = 'facebook';
  static const GOOGLE = 'google';

  final String text;
  final Function onPressed;
  final variant;

  DefaultButton({ this.text, this.onPressed, this.variant = DefaultButton.NORMAL });

  @override
  Widget build(BuildContext context) {
    var color;
    var textColor = Colors.white;

    switch(variant) {
      case DefaultButton.NORMAL:
        color = Colors.deepOrange;
        break;
      case DefaultButton.FACEBOOK:
        color = Colors.blueAccent.shade400;
        break;
      default:
        color = Colors.white54;
        textColor = Colors.black54;
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: color,
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0, color: textColor)
        ),
        onPressed: onPressed,
      )
    );
  }
}
