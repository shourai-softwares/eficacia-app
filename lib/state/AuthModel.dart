import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel extends Model {
  final _profileCollection = Firestore.instance.collection('profiles');
  final _ticketCollection = Firestore.instance.collection('tickets');

  FirebaseUser _user;
  DocumentReference _profileRef;
  DocumentSnapshot _profile;
  bool _isAdmin = false;
  DocumentReference _ticketRef;

  FirebaseUser get user => _user;
  DocumentSnapshot get profile => _profile;
  DocumentReference get profileRef => _profileRef;
  bool get isAdmin => _isAdmin;
  DocumentReference get ticketRef => _ticketRef;

  void setUser(FirebaseUser user) async {
    _user = user;
    final query = await _profileCollection
      .where('user', isEqualTo: _user.uid)
      .getDocuments();

    if (query.documents.isEmpty) {
      final newProfile = Map<String, dynamic>();
      newProfile['user'] = _user.uid;
      _profileRef = await _profileCollection.add(newProfile);
      _profile = await _profileRef.get();
    } else {
      _profile = query.documents.first;
      _profileRef = _profile.reference;

      final ticketQuery = await _ticketCollection
          .where('client', isEqualTo: _user.uid)
          .getDocuments();
      _ticketRef = ticketQuery.documents.first.reference;
    }
    _isAdmin = _profile.data.containsKey('isAdmin') && _profile.data['isAdmin'];

    notifyListeners();
  }

  void updateProfile(String name, String phone, String service) async {
    var newProfileData = Map<String, dynamic>();

    newProfileData['name'] = name;
    newProfileData['phone'] = phone;
    newProfileData['service'] = service;

    await _profileRef.updateData(newProfileData);
    _profile = await _profileRef.get();

    var newTicket = Map<String, dynamic>();

    newTicket['client'] = _user.uid;
    newTicket['service'] = service;
    newTicket['messages'] = [];

    _ticketRef = await _ticketCollection.add(newTicket);

    notifyListeners();
  }
}
