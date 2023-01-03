import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('고객센터',style:
        TextStyle(
            color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Colors.white,
      ),

    );
  }
}