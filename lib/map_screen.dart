import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  late final String title;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // 애플리케이션에서 지도를 이동하기 위한 컨트롤러
  late GoogleMapController _controller;

  // 이 값은 지도가 시작될 때 첫 번째 위치입니다.
  LatLng startLocation = LatLng(36.815,127.07557576716);

  /*final CameraPosition _initialPosition =
  CameraPosition(target: LatLng(41.017901, 28.847953));*/

  // 지도 클릭 시 표시할 장소에 대한 마커 목록
  Set<Marker> markers = {};
  List<Marker> list = [
  Marker(
    markerId: MarkerId("1"),
    position: LatLng(36.768449,127.059024),
    draggable: true,
    onTap: () => print("Marker!"),
    infoWindow: InfoWindow(
        title: 'rrrr',
        snippet: '5dd'
    ),),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(36.8,127.059024),
      draggable: true,
      onTap: () => print("Marker!"),
      infoWindow: InfoWindow(
          title: 'rrrrrr',
          snippet: '5dd'
      ),),
  ];
  @override
  void initState() {
    markers.addAll(list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Color(0xffffffff),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          centerTitle: true,
          //elevation: 10.0,
          title: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed:(){
                  FirebaseAuth.instance.signOut();
                },
              ),

              Text('MAP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              Icon(
                  Icons.arrow_back,
                  color: Color(0xffecf3fc),

              ),
            ],
          ),
          /*leading: */
          flexibleSpace: MapHeader(),

        ),
      ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: startLocation,
            zoom: 11.5,
          ),
          mapType: MapType.normal,
          markers: Set.from(markers),
          //markers: markers.toSet(),
          onMapCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },


          // 클릭한 위치가 중앙에 표시
          /*onTap: (cordinate) {
            _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
            addMarker(cordinate);
          },*/
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        // floatingActionButton 클릭시 줌 아웃
        floatingActionButton: FloatingActionButton(
          hoverElevation: 50,
          onPressed: () {
            LatLng newlatlang = LatLng(36.815,127.07557576716);
            _controller.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 11.5)
                  //17 is new zoom level
                ),
            );
          },
          child: Icon(Icons.refresh),
        ),);

  }
}

class MapHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecf3fc),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Positioned(
                top: 78,
                left: 340,
                child:SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/coolicon9.png'),
                )
            ),
            //Icon(Icons.add_alert_rounded),
            Positioned(
                top: 115,
                left: MediaQuery.of(context).size.width * 0.01,

                child: SizedBox(
                  width: 360,
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
                      hintText: "장소명 또는 주소를 입력하세요.",
                      prefixIcon: Icon(Icons.search),
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
              top: 60,
              left: 35,
              child: Text("지금 현재 지역은",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
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
