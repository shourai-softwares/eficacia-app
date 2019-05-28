import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../state/AuthModel.dart';
import '../templates/client_dashboard.dart';
import '../templates/admin_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AuthModel>(
      builder: (context, child, model) {
        if(model.profile == null) {
          return Text('p null');
        }

        return model.isAdmin ? AdminDashboard() : ClientDashboard();
      },
    );
  }
}