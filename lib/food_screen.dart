import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  static List<String> nowpimage = [
    'assets/profile1.png',
    'assets/profile2.png',
    'assets/profile3.png',
    'assets/profile4.png',
    'assets/profile5.png',
  ];
  static List<String> nowpname = ['박영재','윤승민','임새롬','김겨울','고은'];
  static List<String> nowimage = [
    'assets/#image (6).png',
    'assets/#image (7).png',
    'assets/#image (8).png',
    'assets/#image (9).png',
    'assets/#image (10).png',
  ];
  static List<String> nowtitle = ['호수 매운탕','고향산장','맑음','부에노','아우내엄나무순대'];
  static List<String> nowcontent = ['분위기가 좋았어요','맛있었어요','맛집 추천합니다','GOOD!','다음에 또 올게요!'];
  final List<FoodDataModel> Nowdata = List.generate(
      nowpname.length,
          (index)
      => FoodDataModel('${nowpimage[index]}','${nowpname[index]}','${nowimage[index]}','${nowtitle[index]}',
          '${nowcontent[index]}','${nowpname[index]} Description...'));


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

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffecf3fc),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolleed){
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xffecf3fc),
                  collapsedHeight: 100,
                  expandedHeight: 20,
                  pinned: true,
                  floating: true,
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
                        indicatorWeight: 3,
                        indicatorColor: Colors.red,
                        unselectedLabelColor: Colors.grey,

                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        labelColor: Colors.red,

                      ),
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
                  //그리드뷰 크기 비율
                  childAspectRatio: 5/6,
                  //shrinkWrap: true,
                    //여백
                  mainAxisSpacing:  20.0,
                  crossAxisSpacing: 15.0,
                ),
                itemCount: gridMap.length,
                itemBuilder: (_, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xffecf3fc),

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
                            padding: EdgeInsets.all(5.0),
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
                backgroundColor: Color(0xffecf3fc),
                body: ListView.builder(
                    itemCount: Nowdata.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Stack(
                          children: [
                            Container(
                                    height: 440.0,
                                    //width: MediaQuery.of(context).size.width * 0.5 -65,
                                    decoration: BoxDecoration(
                                      color: Color(0xffecf3fc),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                            //NPIMAGE
                            Positioned(
                                top: 10,
                                left: 10,
                              child: InkWell(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(Nowdata[index].NPImage),
                                  ),
                                ),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[index],)));
                                  }
                              ),
                            ),
                            //NPNAME
                            Positioned(
                              top: 10,
                              left: 70,
                              child: InkWell(
                                  child: Text(
                                    Nowdata[index].NPName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(foodDataModel: Nowdata[index],)));
                                  }
                              ),
                            ),
                            //NIMAGE
                            Positioned(
                              top: 75,
                              left: 10,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(Nowdata[index].NImage,
                                    height: 250,
                                    width: MediaQuery.of(context).size.width * 0.93,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //NTITLE
                            Positioned(
                              top: 330,
                              left: 10,
                              child: Text(
                                Nowdata[index].NTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            //NCONTENT
                            Positioned(
                              top: 360,
                              left: 10,
                              child: Text(
                                Nowdata[index].NContent,
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            //ICON
                            Positioned(
                              top: 400,
                              left: 10,
                              child: InkWell(
                                  child: Image.asset('assets/coolicon6.png'),
                                  /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 400,
                              left: 40,
                              child: InkWell(
                                child: Image.asset('assets/coolicon1.png'),
                                /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 398,
                              left: 65,
                              child: InkWell(
                                child: Image.asset('assets/coolicon2.png'),
                                /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 399,
                              left: 120,
                              child: InkWell(
                                child: Image.asset('assets/coolicon3.png'),
                                /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 400,
                              left: 150,
                              child: InkWell(
                                child: Image.asset('assets/coolicon4.png'),
                                /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 400,
                              left: 180,
                              child: InkWell(
                                child: Image.asset('assets/coolicon5.png'),
                                /*onTap: (){
                                    Navigator.of(context).push(),
                                  }*/
                              ),
                            ),
                            Positioned(
                              top: 335,
                              left: 325,
                              child: Image.asset('assets/coolicon7.png'),
                              ),
                            Positioned(
                              top: 40,
                              left: 360,
                              child: Image.asset('assets/coolicon8.png'),
                            ),
                            Positioned(
                              top: 25,
                              left: 340,
                              child: Text('8m ago',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),),
                              ),
                          ],
                        ),
                      );
                    }),
              ),
              ],
            ),
          ),
        ),
      );
    }
  }
  //1. NOW Page 리스트 클래스
class FoodDataModel{
  late final String NPImage,NPName,NImage,NTitle,NContent,desc;
  FoodDataModel(this.NPImage, this.NPName, this.NImage, this.NTitle, this.NContent,this.desc);
}
//2. NOW Page 이미지 클릭 이벤트 클래스
class FoodDetail extends StatelessWidget{
  final FoodDataModel foodDataModel;
  const FoodDetail({Key? key, required this.foodDataModel}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffB1B8C0),
      ),
      body: Container(
        //height: double.maxFinite,
        //width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 1000,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
              ),
            ),
            Container(
                height: 220,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xffB1B8C0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                ),
              ),
            //도형
           /*Positioned(
                top: 260,
                left: 20,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffBDBDBD), width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xffE8E8E8),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),

            ),*/
            Positioned(
              top: 15,
              left: MediaQuery.of(context).size.width * 0.5 -65,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                          foodDataModel.NPImage,
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                     ),

                  Text(foodDataModel.NPName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  Text('설명',
                    style: TextStyle(
                      fontSize: 10,
                    ),),
                ],
              ),
            ),
            //NIMAGE
            Positioned(
              top: 325,
              left: 10,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(foodDataModel.NImage,
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.93,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //NTITLE
            Positioned(
              top: 580,
              left: 10,
              child: Text(
                foodDataModel.NTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            //NCONTENT
            Positioned(
              top: 610,
              left: 10,
              child: Text(
                foodDataModel.NContent,
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            //ICON
            Positioned(
              top: 650,
              left: 10,
              child: InkWell(
                child: Image.asset('assets/coolicon6.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 650,
              left: 40,
              child: InkWell(
                child: Image.asset('assets/coolicon1.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 648,
              left: 65,
              child: InkWell(
                child: Image.asset('assets/coolicon2.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 649,
              left: 120,
              child: InkWell(
                child: Image.asset('assets/coolicon3.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 650,
              left: 150,
              child: InkWell(
                child: Image.asset('assets/coolicon4.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 650,
              left: 180,
              child: InkWell(
                child: Image.asset('assets/coolicon5.png'),
                /*onTap: (){
                                      Navigator.of(context).push(),
                                    }*/
              ),
            ),
            Positioned(
              top: 585,
              left: 325,
              child: Image.asset('assets/coolicon7.png'),
            ),
            Positioned(
              top: 290,
              left: 360,
              child: Image.asset('assets/coolicon8.png'),
            ),
            Positioned(
              top: 275,
              left: 340,
              child: Text('8m ago',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),),
            ),
            //프로필 카메라 구현
            /*Positioned(
              top: 180,
              left: MediaQuery.of(context).size.width * 0.5 + 30,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xffB1B8C0),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
              ),*/
          ],
        ),
      ),
    );
  }
}
/*class NOWPageList extends StatelessWidget{
   final String NPImage,NPName,NImage,NTitle,NContent,desc;
   NOWPageList(this.NPImage, this.NPName, this.NImage, this.NTitle, this.NContent,this.desc);

   static List<String> nowpimage = [
     'assets/#image (1).png',
     'assets/#image (2).png',
     'assets/#image (3).png',
     'assets/#image (4).png',
     'assets/#image (5).png',
   ];
   static List<String> nowpname = ['사용자1','사용자2','사용자3','사용자4','사용자5'];

   static List<String> nowimage = [
     'assets/#image (1).png',
     'assets/#image (2).png',
     'assets/#image (3).png',
     'assets/#image (4).png',
     'assets/#image (5).png',
   ];

   static List<String> nowtitle = ['사용자1','사용자2','사용자3','사용자4','사용자5'];
   static List<String> nowcontent = ['사용자1','사용자2','사용자3','사용자4','사용자5'];


   final List<NOWPageList> Nowdata = List.generate(
       nowpname.length,
           (index)
       => NOWPageList('${nowpimage[index]}','${nowpname[index]}','${nowimage[index]}','${nowtitle[index]}',
           '${nowcontent[index]}','${nowpname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Nowdata.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(Nowdata[index].NPImage),
            ),
          );
        }),

    );
  }}*/

  //delegate
  class MyDelegate extends SliverPersistentHeaderDelegate{
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return Container(
    height: 100,
    color: Color(0xffecf3fc),
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
        backgroundColor: Color(0xffecf3fc),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Stack(
              children: [
                SizedBox(
                  height: 2.0,
                ),
                Positioned(
                    top: 30,
                    left: 5,
                    child:SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/logo2.png'),
                    )
                ),
                Positioned(
                    top: 37,
                    left: 305,
                    child:SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/search.png'),
                    )
                ),
                Positioned(
                    top: 78,
                    left: 340,
                    child:SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/2km.png'),
                    )
                ),
                Positioned(
                    top: 36,
                    left: 340,
                    child:SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/alarm.png'),
                    )
                ),
                //Icon(Icons.add_alert_rounded),
                Center(
                  child: SizedBox(
                    width: 220,
                    height: 33,
                      child: TextField(
                        style: TextStyle(color: Colors.grey),
                        //textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Color(0xff2b2b2b),
                              width: 1.0,
                            ),
                          ),
                          hintText: "검색어를 입력하세요.",
                          //prefixIcon: Icon(Icons.search),
                          //prefixIconColor: Colors.grey,
                        ),
                      ),
                  ),
                ),
                Positioned(
                    top: 82,
                    left: 15,
                    child:SizedBox(
                      height: 15,
                      width: 15,
                      child: Image.asset('assets/logo3.png'
                      ),
                    )
                ),
                Positioned(
                  top: 80,
                  left: 35,
                  child: Text("충청남도 천안시 동남구",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  top: 79,
                  left: 170,
                  child: Icon(
                    Icons.arrow_drop_down_outlined
                  )
                ),
              ],
          ),
        ),
      );

  }
}
