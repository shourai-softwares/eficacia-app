import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return DefaultTabController(
        length:2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dashboard'),
            actions: <Widget>[
              PopupMenuButton<CustomPopupMenu >(
                onSelected: (CustomPopupMenu choice) {
                  print(choice.onSelect);
                  choice.onSelect();
                },
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
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'A'),
                Tab(text: 'B'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                   Text('nope'),
                  ],
                ),
              ),
              CardList(),
            ],
          ),
        )
    );
  }
}