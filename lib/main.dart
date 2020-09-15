import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marieanusorn/widget/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'มารีย์อนุสรณ์',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Home(),
    );
  }
}
