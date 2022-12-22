import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FoodScreen extends StatefulWidget {

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String,dynamic>> gridMap =[
    {
      "title": "1   호수 매운탕",
      "price": "1",
      "images": "assets/#image (1).png",
    },
    {
      "title": "2   고향산장",
      "price": "\$255",
      "images": "assets/#image (2).png",
    },
    {
      "title": "3   맑음",
      "price": "\$255",
      "images": "assets/#image (3).png",
    },
    {
      "title": "4   부에노",
      "price": "\$255",
      "images": "assets/#image (4).png",
    },
    {
      "title": "5   아우내엄나무순대",
      "price": "\$255",
      "images": "assets/#image (5).png",
    },
    {
      "title": "6   모미지",
      "price": "\$255",
      "images": "assets/#image (6).png",
    },
    {
      "title": "7   포니벨라",
      "price": "\$255",
      "images": "assets/#image (7).png",
    },
    {
      "title": "8   미소레 커피",
      "price": "\$255",
      "images": "assets/#image (8).png",
    },
    {
      "title": "9   앙프",
      "price": "\$255",
      "images": "assets/#image (9).png",
    },
    {
      "title": "10   청룡원조매운탕",
      "price": "\$255",
      "images": "assets/#image (10).png",
    },
    {
      "title": "11   아우내한방순대",
      "price": "\$255",
      "images": "assets/#image (11).png",
    },
    {
      "title": "12   대안식당",
      "price": "\$255",
      "images": "assets/#image (12).png",
    },
    {
      "title": "13   페어리우드베이커리",
      "price": "\$255",
      "images": "assets/#image (13).png",
    },
    {
      "title": "14   꽃분이네애견카페",
      "price": "\$255",
      "images": "assets/#image (14).png",
    },
    {
      "title": "15   더몰트하우스",
      "price": "\$255",
      "images": "assets/#image (15).png",
    },
    {
      "title": "16   천진",
      "price": "\$255",
      "images": "assets/#image (16).png",
    },
    {
      "title": "17   들꽃",
      "price": "\$255",
      "images": "assets/#image (17).png",
    },
    {
      "title": "18   충남집순대",
      "price": "\$255",
      "images": "assets/#image (18).png",
    },
    {
      "title": "19   진성석갈비",
      "price": "\$255",
      "images": "assets/#image (19).png",
    },
    {
      "title": "20   석산장",
      "price": "\$255",
      "images": "assets/#image (20).png",
    },
    {
      "title": "21   밥상차려주는집",
      "price": "\$255",
      "images": "assets/#image (21).png",
    },
    {
      "title": "22   이화갈비",
      "price": "\$255",
      "images": "assets/#image (22).png",
    },
    {
      "title": "23   명동보리밥",
      "price": "\$255",
      "images": "assets/#image (23).png",
    },
    {
      "title": "24   천안 등촌샤브칼국수",
      "price": "\$255",
      "images": "assets/#image (24).png",
    },
    {
      "title": "25   기린더매운갈비찜",
      "price": "\$255",
      "images": "assets/#image (25).png",
    },
    {
      "title": "26   카페시스터즈",
      "price": "\$255",
      "images": "assets/#image (26).png",
    },
    {
      "title": "27   승지원",
      "price": "\$255",
      "images": "assets/#image (27).png",
    },
    {
      "title": "28   정초밥",
      "price": "\$255",
      "images": "assets/#image (28).png",
    },
    {
      "title": "29   여물통",
      "price": "\$255",
      "images": "assets/#image (29).png",
    },
    {
      "title": "30   청화집",
      "price": "\$255",
      "images": "assets/#image (30).png",
    },
  ];

  List<String> posts = [
    'assets/#image (1).png',
    'assets/#image (2).png',
    'assets/#image (3).png',
    'assets/#image (4).png',
    'assets/#image (5).png',
    'assets/#image (6).png',
    'assets/#image (7).png',
    'assets/#image (8).png',
    'assets/#image (9).png',
    'assets/#image (10).png',
    'assets/#image (11).png',
    'assets/#image (12).png',
    'assets/#image (13).png',
    'assets/#image (14).png',
    'assets/#image (15).png',
    'assets/#image (16).png',
    'assets/#image (17).png',
    'assets/#image (18).png',
    'assets/#image (19).png',
    'assets/#image (20).png',
    'assets/#image (21).png',
    'assets/#image (22).png',
    'assets/#image (23).png',
    'assets/#image (24).png',
    'assets/#image (25).png',
    'assets/#image (26).png',
    'assets/#image (27).png',
    'assets/#image (28).png',
    'assets/#image (29).png',
    'assets/#image (30).png',
    'assets/#image (31).png',
    'assets/#image (32).png',
    'assets/#image (33).png',
    'assets/#image (34).png',
  ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolleed){
              return <Widget>[

                SliverAppBar(
                  backgroundColor: Colors.white,
                  collapsedHeight: 100,
                  expandedHeight: 20,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: ProfileView(),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(
                      TabBar(
                        tabs: [
                          Tab(text: "BEST",),
                          Tab(text: "NOW",),
                        ],
                        indicatorColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,

                      )
                  ),
                  floating: false,
                  pinned: true,

                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //shrinkWrap: true,
                  mainAxisSpacing:  20.0,
                  crossAxisSpacing: 2.0,
                ),
                itemCount: gridMap.length,
                itemBuilder: (_, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: Color(0xfffafafa),

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            /*borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),*/
                            child: Image.asset(
                              "${gridMap.elementAt(index)['images']}",
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${gridMap.elementAt(index)['title']}",
                                  style: Theme.of(context).textTheme.subtitle1!.merge(
                                    TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  );
                }
              ),
                //NOWPAGE 구현

              Scaffold(
                body: Container(
                  color: Colors.teal,
                  child: Center(
                      child: Text(
                        'Tab2 Content',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                ),
              ),

              ],
            ),
          ),
        ),
      );
    }
  }
  class MyDelegate extends SliverPersistentHeaderDelegate{
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return Container(
    height: 100,
    color: Colors.white,
    child: tabBar,
  );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
  return false;
  }}

//위 상단 고정바 UI
class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.0,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/logo.png'),
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 38,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      hintText: "검색어를 입력하세요",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                  ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "충청남도 천안시 동남구",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.arrow_drop_down_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      );

  }
}
