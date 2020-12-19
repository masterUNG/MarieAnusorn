import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marieanusorn/models/user_model.dart';
import 'package:marieanusorn/utility/my_constant.dart';
import 'package:marieanusorn/utility/my_style.dart';
import 'package:marieanusorn/utility/normal_dialog.dart';
import 'package:marieanusorn/widget/my_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user, password;

  bool statusLogin = true;

  @override
  void initState() { 
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyStyle().titleH2('สมัครสมาชิก'),
          IconButton(
              icon: Icon(
                Icons.cloud_upload,
                size: 36,
                color: MyStyle().drakColor,
              ),
              onPressed: () {})
        ],
      ),
      body: statusLogin ? MyStyle().showProgress() : buildContent(),
    );
  }

  Container buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: MyStyle().gradient(),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyStyle().showLogo(),
            MyStyle().titleH1('โรงเรียน มารีย์อนุสรณ์'),
            buildTextFieldUser(),
            buildTextFieldPassword(),
            buildRaisedButton(),
          ],
        ),
      ),
    );
  }

  Widget buildRaisedButton() => Container(
        margin: EdgeInsets.only(top: 8),
        width: 220,
        child: RaisedButton(color: Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
            } else {
              checkAuthen();
            }
          },
          child: Text('Login'),
        ),
      );

  Widget buildTextFieldUser() => Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyStyle().drakColor),
        ),
        width: 220,
        height: 40,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'User',
            suffixIcon: Icon(Icons.account_box),
            contentPadding: EdgeInsets.only(left: 16, top: 5),
          ),
        ),
      );

  Widget buildTextFieldPassword() => Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyStyle().drakColor),
        ),
        width: 220,
        height: 40,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {},
            ),
            contentPadding: EdgeInsets.only(left: 16, top: 5),
          ),
        ),
      );

  Future<Null> checkAuthen() async {
    String path =
        '${MyConstant().domain}/App/getUserWhereUser.php?isAdd=true&User=$user';
    // print('path ==>> $path');
    await Dio().get(path).then((value) {
      // print('value ==> ${value.toString()}');
      if (value.toString() == 'null') {
        normalDialog(context, 'ไม่มี $user นี่ใน ฐานข้อมูลของเรา');
      } else {
        var result = json.decode(value.data);
        for (var json in result) {
          UserModel model = UserModel.fromJson(json);
          if (password == model.password) {
            savePreferance(model);
          } else {
            normalDialog(context, 'Password ผิดคะ กรุณาลองใหม่ คะ');
          }
        }
      }
    });
  }

  void routeToService() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MyService(),
        ),
        (route) => false);
  }

  Future<Null> savePreferance(UserModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', model.id);
    routeToService();
  }

  Future<Null> checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id');
    if (id != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyService(),
          ),
          (route) => false);
    } else {
      setState(() {
        statusLogin = false;
      });
    }
  }
}
