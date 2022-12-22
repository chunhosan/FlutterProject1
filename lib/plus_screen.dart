import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlusScreen extends StatefulWidget {

  @override
  _PlusScreenState createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlusScreen"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed:(){
            FirebaseAuth.instance.signOut();
          },

        ),

      ),
    );

  }

}

