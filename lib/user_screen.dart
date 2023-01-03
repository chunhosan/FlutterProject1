import 'package:app1/menu/center_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app1/menu/setting_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu/faq.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // 앱바 왼편에 햄버거 버튼 생성
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile2.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                /*CircleAvatar(
                  backgroundImage: AssetImage('assets/github.png'),
                  backgroundColor: Colors.white,
                )*/
              ],
              accountName: Text('천호산',style: TextStyle(color: Colors.black),),
              arrowColor: Colors.black,
              accountEmail: Text('chunhosan07@gmail.com',style: TextStyle(color: Colors.black),),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Color(0xffBDBDBD),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            /*ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850]),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),*/
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850]),
              title: Text('Setting'),
              onTap: () {
                //print('Setting is clicked');
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> Setting())
                );
              },
              //trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
              title: Text('Q&A'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> FAQ())
                );
              },
              //trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_mark, color: Colors.grey[850]),
              title: Text('고객센터'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> Service())
                );
              },
              //trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.login_outlined, color: Colors.grey[850]),
              title: Text('로그아웃'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              //trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('사용자',style: TextStyle(color: Colors.black,fontSize: 30),),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Color(0xffBDBDBD),
        actions: <Widget>[
         IconButton(
            color: Colors.black,
            icon: Icon(Icons.edit), // 검색 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print('Search button is clicked');
            },
          ),
          /*IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu), // 검색 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행

            },
          ),*/
        ],

      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffBDBDBD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(60),
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              'assets/profile2.png',
                              height: 130,
                              width: 130,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height*0.11,
                        left: MediaQuery.of(context).size.width*0.58,
                        child: Icon(Icons.camera_alt_rounded,size: 40,color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.005,
                  ),
                  Text('천호산',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Text('컴퓨터공학부 전공',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                //NPIMAGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,20,0),
                          child: Text(
                            '8m ago',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/coolicon8.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/#image (1).png',
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.93,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                      child: Text(
                        '음식점',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/coolicon7.png'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                      child: Text(
                        '맛있어요',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,3,0,0),
                      child: Row(
                          children: [
                            Text('8m ago',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),),
                          ]
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Row(
                          children: [
                            Icon(Icons.favorite_border),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Icon(Icons.messenger_outline),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Icon(Icons.share),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15,0,0,0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(Icons.facebook),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3,0,0,0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(FontAwesomeIcons.twitter),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3,0,0,0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Icon(FontAwesomeIcons.instagram),
                                  ),

                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
