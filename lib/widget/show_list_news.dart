import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marieanusorn/utility/my_constant.dart';

class ShowListNews extends StatefulWidget {
  @override
  _ShowListNewsState createState() => _ShowListNewsState();
}

class _ShowListNewsState extends State<ShowListNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readNews();
  }

  Future<Null> readNews() async {
    String path = '${MyConstant().domain}/App/getAllNews.php';
    await Dio().get(path).then((value) {
      print('value ==> $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('News'),
    );
  }
}
