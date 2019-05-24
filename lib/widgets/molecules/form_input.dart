import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool obscureText;
  final TextInputType keyboardType;


  FormInput({
    this.icon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: hintText,
            icon: new Icon(icon, color: Colors.grey)
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}