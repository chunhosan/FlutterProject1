import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusScreen extends StatefulWidget {

  @override
  _PlusScreenState createState() => _PlusScreenState();
}
//플러스 리스트1,2
class PlusDataModel1{
  late final String subtitle,title,icon,desc1;
  PlusDataModel1(this.subtitle, this.title,this.icon,this.desc1);
}
class PlusDataModel2{
  late final String plusimage,plustitle,desc2;
  PlusDataModel2(this.plusimage,this.plustitle,this.desc2);
}
class _PlusScreenState extends State<PlusScreen> {
  static List<String> subtitle = ['숨어있는','핫플레이스','자주검색하는','인기'];
  static List<String> title = ['맛집','오락,문화시설','장소','더보기'];
  static List<IconData> icons = [Icons.restaurant,Icons.sports_esports,Icons.storefront,Icons.add_box];
  final List<PlusDataModel1> Plusdata1 = List.generate(
      title.length,
          (index)
      => PlusDataModel1('${subtitle[index]}','${title[index]}','${icons[index]}','${subtitle[index]} Description...'));

  static List<String> plusimage = [
    'assets/plusimage1.png',
    'assets/plusimage2.png',
    'assets/plusimage3.png',
    'assets/plusimage4.png',
  ];
  static List<String> plustitle = ['놀숲 만화방 신부점','캠프 VR','코인노래방 불당점','천안 PC방'];
  final List<PlusDataModel2> Plusdata2 = List.generate(
      plustitle.length,
          (index)
      => PlusDataModel2('${plusimage[index]}','${plustitle[index]}','${plusimage[index]} Description...'));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          centerTitle: true,
          //elevation: 10.0,
          title: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('PLUS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),
          /*leading: */
          flexibleSpace: PlusHeader(),
        ),
      ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                // height: 200,
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                    // itemExtent: 200,
                  itemExtent: MediaQuery.of(context).size.height * 0.24,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: Text(
                                  Plusdata1[index].subtitle,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: Text(
                                  Plusdata1[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.05,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          icons[index],
                                          size: 50,
                                          color: Colors.grey,
                                          //color: Colors.,
                                        ),
                                      ],
                                    ),
                              ),],
                          ),
                          margin: EdgeInsets.all(5.0),
                          // color: Colors.orangeAccent,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: RadialGradient(colors: [Colors.white,Color(0xffEAF3FE)],
                              center: Alignment(0.5,1),
                              radius: 0.8
                            ),
                          ),
                    ),
                    itemCount: 4),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        child: Column(
                          children: [
                            //NPIMAGE
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(Plusdata2[index].plusimage,
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
                                    Plusdata2[index].plustitle,
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
                childCount: Plusdata2.length,
              ),
            ),

          ],
        ));



  }

}

class CategoryCard {

}

class PlusHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width*0.24,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width*0.1,
                width: MediaQuery.of(context).size.width*0.9,
                child: TextField(
                  style: TextStyle(color: Colors.grey),
                  //textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Color(0xff2b2b2b),
                        width: 1.0,
                      ),
                    ),
                    hintText: "장소명 또는 주소를 입력하세요.",
                    prefixIcon: Icon(Icons.search),
                    //prefixIconColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}

