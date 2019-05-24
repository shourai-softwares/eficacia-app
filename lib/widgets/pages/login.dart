import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/authentication.dart';
import '../molecules/form_input.dart';
import '../atoms/loader_overlay.dart';
import '../atoms/default_button.dart';
import '../atoms/default_flat_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<LoginScreen> createState() => new _LoginScreenState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  FormMode _formMode = FormMode.LOGIN;
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

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
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
              text: _formMode == FormMode.LOGIN ? 'Login' : 'Create Account',
              onPressed: _validateAndSubmit,
            ),
            DefaultFlatButton(
              text: _formMode == FormMode.LOGIN ? 'Create an account' : 'Have an account? Sign in',
              onPressed: _formMode == FormMode.LOGIN ? _changeFormToSignUp : _changeFormToLogin,
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
      if (_formMode == FormMode.LOGIN) {
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