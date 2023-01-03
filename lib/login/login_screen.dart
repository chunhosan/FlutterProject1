import 'package:app1/chat_screen2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    User firebaseUser = await firebaseAuth.currentUser!;
    if (firebaseUser != null) {
      MaterialPageRoute(
          builder: (context) => ChatScreen2(prefs.getString('nickname')));
      context;
    };
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loginj'),),
      body: Center(
        child: ElevatedButton(
          child: Text('login'),
          onPressed: login,
        ),
      ),
    );
  }

  Future login() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    User? firebaseUser = (await firebaseAuth.signInWithCredential(credential))
        .user;

    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .get();
      await FirebaseFirestore.instance.collection('users').where(
          'id', isEqualTo: firebaseUser.uid).get();
      final List <DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        // Update data to server if new user
        FirebaseFirestore.instance.collection('users')
            .doc(firebaseUser.uid)
            .set(
            { 'nickname': firebaseUser.displayName,
              'photoUrl': firebaseUser.photoURL,
              'id': firebaseUser.uid,
              'chattingWith': null
            });
        await prefs.setString('id', firebaseUser.uid);
        await prefs.setString('nickname', firebaseUser.displayName!);
        await prefs.setString('photoUrl', firebaseUser.photoURL!);
      } else {
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('nickname', documents[0]['nickname']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        await prefs.setString('aboutMe', documents[0]['aboutMe']);
      }
      Navigator.push(context,MaterialPageRoute(builder: (context) => ChatScreen2(firebaseUser.displayName)));
      }
    }
  }