import 'dart:async';
import 'package:app1/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget {
  @override
  _LogoPage createState() => _LogoPage();
}

class _LogoPage extends State<LogoPage>{
  @override
  void initState() {
    super.initState();
    //splash 로고 화면을 구현한 후 3초정도 대기하기 위한 위젯 사용
    Timer(Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Authentication(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Center(
          child: Image.asset('assets/logo.png')),
    );
  }
}

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: (context, constraints, double) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              );
            },
            providerConfigs: [EmailProviderConfiguration()],
          );
        }
        return bottombar();
      },
    );
  }
}

