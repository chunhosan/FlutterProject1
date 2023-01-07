import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
   @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolleed){
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xffffffff),
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
                      color: Color(0xffffffff),

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: ClipRRect(
                              child: Image.asset(
                                "${gridMap.elementAt(index)['images']}",
                                height: MediaQuery.of(context).size.height*0.23,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail2(foodDataModel2: Nowdata2[index],)));
                              }
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
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
                },
              ),
                //NOWPAGE 구현
              Scaffold(
                backgroundColor: Color(0xffffffff),
                body: ListView.builder(
                    itemCount: Nowdata.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            //NPIMAGE
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Nowdata[index].NPName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Nowdata[index].NImage,
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
                                    Nowdata[index].NTitle,
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
                                    Nowdata[index].NContent,
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
                      );
                    }),
              ),
              ],
            ),
          ),
        ),
      );
    }
   static List<String> nowpimage = [
     'assets/profile1.png', 'assets/profile2.png', 'assets/profile3.png', 'assets/profile4.png', 'assets/profile5.png',
   ];
   static List<String> nowpname = ['박영재','천호산','임새롬','김겨울','고은'];
   static List<String> nowimage = [
     'assets/#image (6).png', 'assets/#image (7).png', 'assets/#image (8).png', 'assets/#image (9).png', 'assets/#image (10).png',
   ];
   static List<String> nowtitle = ['호수 매운탕','고향산장','맑음','부에노','아우내엄나무순대'];
   static List<String> nowcontent = ['분위기가 좋았어요','맛있었어요','맛집 추천합니다','GOOD!','다음에 또 올게요!'];
   final List<FoodDataModel> Nowdata = List.generate(
       nowpname.length,
           (index)
       => FoodDataModel('${nowpimage[index]}','${nowpname[index]}','${nowimage[index]}','${nowtitle[index]}',
           '${nowcontent[index]}','${nowpname[index]} Description...'));
   static List<Map<String,dynamic>> gridMap = [
     {"title": "1   호수 매운탕", "price": "1", "images": "assets/#image (1).png",}, {"title": "2   고향산장", "price": "\$255", "images": "assets/#image (2).png",}, {"title": "3   맑음", "price": "\$255", "images": "assets/#image (3).png",}, {"title": "4   부에노", "price": "\$255", "images": "assets/#image (4).png",}, {"title": "5   아우내엄나무순대", "price": "\$255", "images": "assets/#image (5).png",}, {"title": "6   모미지", "price": "\$255", "images": "assets/#image (6).png",}, {"title": "7   포니벨라", "price": "\$255", "images": "assets/#image (7).png",}, {"title": "8   미소레 커피", "price": "\$255", "images": "assets/#image (8).png",}, {"title": "9   앙프", "price": "\$255", "images": "assets/#image (9).png",},
     {"title": "10   청룡원조매운탕", "price": "\$255", "images": "assets/#image (10).png",}, {"title": "11   아우내한방순대", "price": "\$255", "images": "assets/#image (11).png",}, {"title": "12   대안식당", "price": "\$255", "images": "assets/#image (12).png",}, {"title": "13   페어리우드베이커리", "price": "\$255", "images": "assets/#image (13).png",}, {"title": "14   꽃분이네애견카페", "price": "\$255", "images": "assets/#image (14).png",}, {"title": "15   더몰트하우스", "price": "\$255", "images": "assets/#image (15).png",}, {"title": "16   천진", "price": "\$255", "images": "assets/#image (16).png",}, {"title": "17   들꽃", "price": "\$255", "images": "assets/#image (17).png",}, {"title": "18   충남집순대", "price": "\$255", "images": "assets/#image (18).png",}, {"title": "19   진성석갈비", "price": "\$255", "images": "assets/#image (19).png",},
     {"title": "20   석산장", "price": "\$255", "images": "assets/#image (20).png",}, {"title": "21   밥상차려주는집", "price": "\$255", "images": "assets/#image (21).png",}, {"title": "22   이화갈비", "price": "\$255", "images": "assets/#image (22).png",}, {"title": "23   명동보리밥", "price": "\$255", "images": "assets/#image (23).png",}, {"title": "24   천안 등촌샤브칼국수", "price": "\$255", "images": "assets/#image (24).png",}, {"title": "25   기린더매운갈비찜", "price": "\$255", "images": "assets/#image (25).png",}, {"title": "26   카페시스터즈", "price": "\$255", "images": "assets/#image (26).png",}, {"title": "27   승지원", "price": "\$255", "images": "assets/#image (27).png",}, {"title": "28   정초밥", "price": "\$255", "images": "assets/#image (28).png",}, {"title": "29   여물통", "price": "\$255", "images": "assets/#image (29).png",},
     {"title": "30   청화집", "price": "\$255", "images": "assets/#image (30).png",},
   ];
   static List<String> mpimage = [
     'assets/#image (1).png', 'assets/#image (2).png', 'assets/#image (3).png', 'assets/#image (4).png', 'assets/#image (5).png', 'assets/#image (6).png', 'assets/#image (7).png', 'assets/#image (8).png', 'assets/#image (9).png',
     'assets/#image (10).png', 'assets/#image (11).png', 'assets/#image (12).png', 'assets/#image (13).png', 'assets/#image (14).png', 'assets/#image (15).png', 'assets/#image (16).png', 'assets/#image (17).png', 'assets/#image (18).png', 'assets/#image (19).png',
     'assets/#image (20).png', 'assets/#image (21).png', 'assets/#image (22).png', 'assets/#image (23).png', 'assets/#image (24).png', 'assets/#image (25).png', 'assets/#image (26).png', 'assets/#image (27).png', 'assets/#image (28).png', 'assets/#image (29).png', 'assets/#image (30).png',
   ];
   static List<String> mptext = [
     '호수 매운탕', '고향산장','맑음','부에노','아우내엄나무순대','모미지','포니벨라','미소레 커피','앙프','청룡원조매운탕',
     '아우내한방순대','대안식당','페어리우드베이커리','꽃분이네애견카페','더몰트하우스','천진','들꽃','충남집순대','진성석갈비','석산장',
     '밥상차려주는집','이화갈비','명동보리밥','천안 등촌샤브칼국수','기린더매운갈비찜','카페시스터즈','승지원','정초밥','여물통','청화집',
   ];
   static List<String> mplocation = [
     '충청남도 천안시 서북구 성성2길 61(성성동)','충청남도 천안시 동남구 북면 충절로 1474-19','충청남도 천안시 동남구 유량로 194(유량동)','충청남도 천안시 동남구 남부대로 336(청당동)','충청남도 천안시 동남구 병천면 아우내순대길 1','충청남도 천안시 서북구 서부대로 427','충청남도 천안시 동남구 유량로 130(유량동)',
     '충청남도 천안시 동남구 단대로 161-1','충청남도 천안시 동남구 천안천변길 139(신방동)','충청남도 천안시 서북구 입장면 성진로 1406','충청남도 천안시 동남구 병천면 아우내순대길 18','충청남도 천안시 서북구 도원7길 17(성정동)','충청남도 천안시 동남구 천호지길 44(안서동)','충청남도 천안시 동남구 통정4로 22-25(신방동)','충청남도 천안시 서북구 불당31길 22(불당동)','충청남도 천안시 동남구 공고담길 43-5','충청남도 천안시 동남구 호서대길 110',
     '충청남도 천안시 동남구 병천면 충절로 1748','충청남도 천안시 동남구 목천읍 충절로 1166','충청남도 천안시 동남구 문화로 30(문화동)','충청남도 천안시 동남구 풍세로 702(구룡동)','충청남도 천안시 서북구 불당29길 18(불당동)','충청남도 천안시 서북구 미라7길 17','충청남도 천안시 서북구 두정로 132(두정동)','충청남도 천안시 서북구 불당16길 34-6','충청남도 천안시 서북구 불당16길 1','충청남도 천안시 서북구 노태산로 41(백석동)','충청남도 천안시 서북구 늘푸른6길 5-11(두정동)','충청남도 천안시 서북구 봉정로 111','충청남도 천안시 동남구 병천면 충절로 1749',
   ];

   final List<FoodDataModel2> Nowdata2 = List.generate(
       mpimage.length,
           (index)
       => FoodDataModel2('${mpimage[index]}','${mptext[index]}','${mplocation[index]}','${mpimage[index]} Description...'));

}
  //1. NOW Page 이미지 클릭 이벤트 클래스
class FoodDataModel{
  late final String NPImage,NPName,NImage,NTitle,NContent,desc;
  FoodDataModel(this.NPImage, this.NPName, this.NImage, this.NTitle, this.NContent,this.desc);
}
class FoodDetail extends StatelessWidget{
  final FoodDataModel foodDataModel;
  const FoodDetail({Key? key, required this.foodDataModel}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('프로필',style:
        TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
        )),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Color(0xffBDBDBD),
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
                        child: Image.asset(foodDataModel.NImage,
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
                        foodDataModel.NTitle,
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
                        foodDataModel.NContent,
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
          ],
        ),
      ),
    );
  }
}
//2. 맛집 이미지 정보
class FoodDataModel2 {
  late final String mpimage,mptitle,mplocation,desc;
  FoodDataModel2(this.mpimage,this.mptitle,this.mplocation,this.desc);
}

class FoodDetail2 extends StatelessWidget{
  final FoodDataModel2 foodDataModel2;
  const FoodDetail2({Key? key, required this.foodDataModel2}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(foodDataModel2.mptitle,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),

        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Color(0xffB1B8C0),
        backgroundColor: Color(0xffBDBDBD),
      ),
      body: Container(
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
                  /*SizedBox(
                    height: 10,
                    width: 30,
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      //"${mapp.gm.elementAt(index)['images']}",
                      foodDataModel2.mpimage,
                      height: MediaQuery.of(context).size.height*0.28,
                      width: MediaQuery.of(context).size.width*1.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  //Text(foodDataModel2.mplocation),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Text(foodDataModel2.mplocation,
              style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),

          ],
        ),
      ),
      /*body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('dd'),
            pinned: true,
            // floating 설정. SliverAppBar는 스크롤 다운되면 화면 위로 사라짐.
            // true: 스크롤 업 하면 앱바가 바로 나타남. false: 리스트 최 상단에서 스크롤 업 할 때에만 앱바가 나타남
            floating: false,
            // flexibleSpace에 플레이스홀더를 추가
            flexibleSpace: Placeholder(),
            // 최대 높이
            expandedHeight: 200,
          ),
          // 리스트 추가
          SliverList(
            // 아이템을 빌드하기 위해서 delegate 항목을 구성함
            // SliverChildBuilderDelegate는 ListView.builder 처럼 리스트의 아이템을 생성해줌
            delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 150),
          ),
        ],
      ),*/
    );
  }
}
  //delegate
  class MyDelegate extends SliverPersistentHeaderDelegate{
  MyDelegate(this.tabBar);
  final TabBar tabBar;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return Container(
    height: 100,
    color: Color(0xffffffff),
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
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15,8,0,0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/logo2.png'),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,0),
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Icon(FontAwesomeIcons.search,color: Colors.grey,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5,0,0,0),
                child: Icon(Icons.notifications,size: 35,color: Colors.grey,),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,0,0),
                child: Row(
                  children: [
                    Image.asset('assets/logo3.png'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,0,0,0),
                      child: Text("충청남도 천안시 동남구",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                        Icons.arrow_drop_down_outlined
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,30,0),
                      child: Image.asset('assets/2km.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
