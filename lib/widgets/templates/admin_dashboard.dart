import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'card_list.dart';

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon, this.onSelect});

  String title;
  IconData icon;
  Function onSelect;
}

class AdminDashboard extends StatelessWidget {
  final List<CustomPopupMenu> choices = <CustomPopupMenu>[
    CustomPopupMenu(title: 'Logout', icon: Icons.exit_to_app, onSelect: () => FirebaseAuth.instance.signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu >(
            onSelected: (CustomPopupMenu choice)  => choice.onSelect(),
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            }
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('tickets').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('${snapshot.error}');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: Text('loading'));
            default:
              return CardList(cards: snapshot.data.documents);
          }
        },
      ),
    );
  }
}