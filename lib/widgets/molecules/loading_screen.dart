import 'package:flutter/material.dart';
import '../atoms/loader_overlay.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoaderOverlay(show: true, child: Text('')));
  }
}