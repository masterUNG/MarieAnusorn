import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marieanusorn/models/news_model.dart';
import 'package:marieanusorn/utility/my_constant.dart';
import 'package:marieanusorn/utility/my_style.dart';

class ShowListNews extends StatefulWidget {
  @override
  _ShowListNewsState createState() => _ShowListNewsState();
}

class _ShowListNewsState extends State<ShowListNews> {
  List<NewsModel> newsModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readNews();
  }

  Future<Null> readNews() async {
    String path = '${MyConstant().domain}/App/getAllNews.php';
    await Dio().get(path).then((value) {
      // print('value ==> $value');
      for (var json in json.decode(value.data)) {
        NewsModel model = NewsModel.fromJson(json);
        setState(() {
          newsModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newsModels.length == 0
          ? MyStyle().showProgress()
          : ListView.builder(
              itemCount: newsModels.length,
              itemBuilder: (context, index) => Column(
                children: [
                  buildTitle(context, index),
                  Row(
                    children: [
                      buildDetail(context, index),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${MyConstant().domain}/${newsModels[index].picture}',
                          placeholder: (context, url) =>
                              MyStyle().showProgress(),
                          errorWidget: (context, url, error) =>
                              Image.asset('images/pic.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Container buildDetail(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        spitContent(newsModels[index].detail),
      ),
    );
  }

  Container buildTitle(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: MyStyle().titleH1(newsModels[index].name),
    );
  }

  String spitContent(String string) {
    if (string.length > 40) {
      return string.substring(0, 80) + '...';
    }
    return string;
  }
}
