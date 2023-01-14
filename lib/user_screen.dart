import 'package:app1/menu/center_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app1/menu/setting_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu/faq.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  static List<String> userimage1 = [
    'assets/userimage/userimage1/userimage1-1.jpg',
    'assets/userimage/userimage1/userimage1-2.jpg',
    'assets/userimage/userimage1/userimage1-3.jpg',
  ];
  static List<String> userimage2 = [
    'assets/userimage/userimage2/userimage2-1.jpg',
    'assets/userimage/userimage2/userimage2-2.jpg',
    'assets/userimage/userimage2/userimage2-3.jpg',
  ];
  int currentIndex1 = 0;
  int currentIndex2 = 0;

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
            icon: Icon(FontAwesomeIcons.solidSquarePlus), // 검색 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print('Search button is clicked');
            },
          ),
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
      /*body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
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
                    height: MediaQuery.of(context).size.height * 0.01,
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
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Text('천호산',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  Text('컴퓨터공학부 전공',
                    style: TextStyle(
                      fontSize: 15,
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
      ),*/
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
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
                  height: MediaQuery.of(context).size.height * 0.01,
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
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Text('천호산',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Text('컴퓨터공학부 전공',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                            (context, index) => Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              //NPIMAGE
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        padEnds: false,
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex1 = index;
                                          });
                                        },
                                        enlargeCenterPage: false,
                                        height: MediaQuery.of(context).size.height*0.3,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        reverse: false,
                                        aspectRatio: 2.0,
                                        disableCenter: true,
                                        viewportFraction: 1,
                                      ),
                                      itemCount: userimage1.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1.5,
                                            width: MediaQuery.of(context).size.width*1.5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                userimage1[i],
                                                width: MediaQuery.of(context).size.width*1.5,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          /*onTap: (){
                                            var image = plusimage2[i];
                                          },*/
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              /*Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(Nowdata[0].NImage,
                                        height: 250,
                                        width: MediaQuery.of(context).size.width * 0.93,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),*/

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '마초쉐프 천안점',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int i = 0; i<userimage1.length; i++)
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.02,
                                            width: MediaQuery.of(context).size.width*0.02,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: currentIndex1 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 1,
                                                  blurRadius: 3,
                                                  offset: Offset(2,2),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '피자 정말 맛있었어요',
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
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                  child: Icon(FontAwesomeIcons.twitter),
                                                ),
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
                        ),
                      )),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                            (context, index) => Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              //NPIMAGE
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        padEnds: false,
                                        onPageChanged: (index,reason){
                                          setState(() {
                                            print(reason.toString());
                                            currentIndex2 = index;
                                          });
                                        },
                                        enlargeCenterPage: false,
                                        height: MediaQuery.of(context).size.height*0.3,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        reverse: false,
                                        aspectRatio: 2.0,
                                        disableCenter: true,
                                        viewportFraction: 1,
                                      ),
                                      itemCount: userimage2.length,
                                      itemBuilder: (context,i,id){
                                        return GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*1.5,
                                            width: MediaQuery.of(context).size.width*1.5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.asset(
                                                userimage2[i],
                                                width: MediaQuery.of(context).size.width*1.5,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          /*onTap: (){
                                            var image = plusimage2[i];
                                          },*/
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              /*Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(Nowdata[0].NImage,
                                        height: 250,
                                        width: MediaQuery.of(context).size.width * 0.93,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),*/

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '시유당',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for(int i = 0; i<userimage2.length; i++)
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.02,
                                            width: MediaQuery.of(context).size.width*0.02,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: currentIndex2 == i ? Color(0xff5DB075) : Color(0xffE8E8E8),
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 1,
                                                  blurRadius: 3,
                                                  offset: Offset(2,2),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(10,0,4,0),
                                    child: Text(
                                      '카페 안 뷰가 너무 좋았어요!',
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
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                  child: Icon(FontAwesomeIcons.twitter),
                                                ),
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
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      )

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
