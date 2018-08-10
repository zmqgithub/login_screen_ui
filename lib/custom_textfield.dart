import 'package:flutter/material.dart';

class SHTextField extends StatelessWidget {
  SHTextField({this.controller,this.hintText, this.obscure = false, this.icon});
  TextEditingController controller;
  String hintText;
  bool obscure;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            icon,
            color: Colors.yellow[900],
          ),
          new SizedBox(
            width: width / 30,
          ),
          new Expanded(child: new TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
            ),
          )),
        ],
      ),
      padding: EdgeInsets.only(bottom: 4.0,),
      margin: EdgeInsets.only(top: height/40,right: width/20, left: width/20),
      decoration: BoxDecoration(
          border: new Border(bottom: BorderSide(color: Colors.yellow[900]))),
    );
  }
}
