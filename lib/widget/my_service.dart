import 'package:flutter/material.dart';
import 'package:marieanusorn/widget/show_list_child.dart';
import 'package:marieanusorn/widget/show_list_news.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<Widget> widgets = [ShowListNews(), ShowListChild()];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<BottomNavigationBarItem> listBottons() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'ข่าวสาร'),
      BottomNavigationBarItem(icon: Icon(Icons.child_care), label: 'บุตร'),
    ].toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โรงเรียน มารีย์อนุสรณ์'),
      ),
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        items: listBottons(),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
