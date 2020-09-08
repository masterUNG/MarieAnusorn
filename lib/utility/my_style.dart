import 'package:flutter/material.dart';

class MyStyle {
  Color drakColor = Colors.indigo;

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
