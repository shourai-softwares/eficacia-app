import 'package:flutter/material.dart';
import '../templates/client_dashboard.dart';
import '../templates/admin_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAdmin = true;

    if (isAdmin) {
      return AdminDashboard();
    }

    return ClientDashboard();
  }
}