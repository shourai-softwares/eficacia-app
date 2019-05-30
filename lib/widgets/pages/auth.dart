import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../molecules/form_input.dart';
import '../atoms/loader_overlay.dart';
import '../atoms/default_button.dart';

enum FormMode { LOGIN, SIGNUP }

class AuthScreen extends StatefulWidget {
  final FormMode mode;

  AuthScreen({ this.mode });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isIos;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoaderOverlay(
        child: _showBody(),
        show: _isLoading,
      ),
    );
  }

  Widget _showBody(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            FormInput(
              icon: Icons.mail,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value,
            ),
            FormInput(
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: true,
              validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
              onSaved: (value) => _password = value,
            ),
            DefaultButton(
              text: this.widget.mode == FormMode.LOGIN ? 'Login' : 'Create Account',
              onPressed: _validateAndSubmit,
            ),
            _showErrorMessage(),
          ],
        ),
      )
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    if (!_validateAndSave()) {
      return;
    }

    FirebaseAuth auth = FirebaseAuth.instance;
    String userId = "";

    try {
      if (this.widget.mode == FormMode.LOGIN) {
        FirebaseUser user = await auth.signInWithEmailAndPassword(email: _email, password: _password);
        userId = user.uid;
        print('Signed in: $userId');
      } else {
        FirebaseUser user = await auth.createUserWithEmailAndPassword(email: _email, password: _password);
        userId = user.uid;
        print('Signed up user: $userId');
      }

      if (userId.length > 0 && userId != null) {
        debugPrint(userId);
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        if (_isIos) {
          _errorMessage = e.details;
        } else
          _errorMessage = e.message;
      });
    }
  }
}