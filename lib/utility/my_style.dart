import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class MyStyle {
  Color drakColor = Colors.indigo;

  Widget showProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Gradient gradient() {
    return FlutterGradients.saintPetersburg(
      type: GradientType.radial,
      radius: 1.2,
    );
  }

  Widget titleH1(String string) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        string,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: drakColor,
        ),
      ),
    );
  }

  Widget titleH2(String string) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        string,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: drakColor,
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100,
      child: Image.asset('images/logo_marie.png'),
    );
  }

  MyStyle();
}
