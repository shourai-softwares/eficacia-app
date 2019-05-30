import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../state/AuthModel.dart';
import '../molecules/form_input.dart';
import '../atoms/default_button.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List _cities = ["Cluj-Napoca", "Bucuresti", "Timisoara", "Brasov", "Constanta"];
  var _currentValue = "Cluj-Napoca";

  String _name;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete seus dados'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormInput(
                hintText: 'Nome Completo',
                icon: Icons.person,
                onSaved: (value) => _name = value,
              ),
              FormInput(
                hintText: 'Celular',
                icon: Icons.phone_android,
                onSaved: (value) => _phone = value,
              ),
              DropdownButton(
                value: _currentValue,
                items: _getDropDownMenuItems(),
                onChanged: (selected) => setState(() {
                  _currentValue = selected;
                }),
              ),
              ScopedModelDescendant<AuthModel>(
                builder: (context, child, model) => DefaultButton(
                  text: 'Salvar',
                  onPressed: () => _handleSubmit(model),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String city in _cities) {
      items.add(DropdownMenuItem(
          value: city,
          child: Text(city)
      ));
    }
    return items;
  }

  void _handleSubmit(AuthModel model) {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      model.updateProfile(_name, _phone, _currentValue);
    }
  }
}