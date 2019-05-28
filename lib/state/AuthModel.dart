import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel extends Model {
  FirebaseUser _user;
  DocumentSnapshot _profile;
  bool _isAdmin = false;

  FirebaseUser get user => _user;
  DocumentSnapshot get profile => _profile;
  bool get isAdmin => _isAdmin;

  void setUser(FirebaseUser user) {
    _user = user;

    Firestore.instance
      .collection('profiles')
      .where('user', isEqualTo: _user.uid)
      .getDocuments()
      .then((snapshot) {
         _profile = snapshot.documents.first;
         _isAdmin = _profile.data['isAdmin'];

         notifyListeners();
      });
  }
}
