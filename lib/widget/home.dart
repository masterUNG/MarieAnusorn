import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:marieanusorn/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
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
      ),
    );
  }

  Widget buildRaisedButton() => Container(
        margin: EdgeInsets.only(top: 8),
        width: 220,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {},
          child: Text('Login'),
        ),
      );

  Widget buildTextFieldUser() => Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyStyle().drakColor),
        ),
        width: 220,
        height: 40,
        child: TextField(
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
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyStyle().drakColor),
        ),
        width: 220,
        height: 40,
        child: TextField(
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
}
