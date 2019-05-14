import 'package:flutter/material.dart';
import '../templates/CardList.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
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
                  Text('titualao'),
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