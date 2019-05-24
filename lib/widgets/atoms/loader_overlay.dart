import 'package:flutter/material.dart';

class LoaderOverlay extends StatelessWidget {
  final bool show;
  final Widget child;

  LoaderOverlay({ this.show, this.child });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      showCircularProgress(),
    ]);
  }

  Widget showCircularProgress() {
    if (show) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(height: 0.0, width: 0.0,);
  }
}