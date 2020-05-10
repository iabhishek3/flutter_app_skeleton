
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/drawerconfig.dart';
import '../src/pages/call.dart';
 class GridDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GridDashboardState();
  }
class GridDashboardState extends State<GridDashboard> {
  /// create a channelController to retrieve text value
  final _channelController = '1122';
  /// if channel textField is validated to have error
  bool _validateError = false;
  Items item3 = new Items(
    name: "Dr. Iris",
    distance: "4.5 km",
    star: 2,
    img: "assets/3.png",
  );
  Items item4 = new Items(
    name: "Dr. Cisco Ramon",
    distance: "2.4 km",
    star: 5,
    img: "assets/4.png",
  );
  Items item5 = new Items(
    name: "Dr Wally",
    distance: "1.4 km",
    star: 3,
    img: "assets/5.png",
  );
  Items item6 = new Items(
    name: "Dr. Julian",
    distance: "3.2 km",
    star: 3,
    img: "assets/6.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [ item3, item4, item5, item6,item6,item6,item6,item6];
    var color = 0xff453658;
    return Scaffold(
        drawer:MyDrawer(),
        appBar: AppBar(
            title: Text("Doctors", style: TextStyle(fontSize: 24)),
            centerTitle: true,
            backgroundColor: Colors.indigo
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 1, right: 1),
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              children: myList.map((data) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100] ,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 100,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        data.name,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data.distance,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                          GestureDetector(
                            onTap:onJoin,
                            child:  new IconTheme(
                              data: new IconThemeData(color: Colors.green),
                              child: new Icon(Icons.video_call, size: 30,), // I want to iterate this "star icon" for reviews.ratings.length times
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for( var i = 0 ; i < data.star; i++ )
                            new IconTheme(
                              data: new IconThemeData(color: Colors.orange),
                              child: new Icon(Icons.star, size: 20,), // I want to iterate this "star icon" for reviews.ratings.length times
                            ),
                        ],
                      ),

                    ],
                  ),
                );
              }).toList()),
        ));
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}

class Items {
  String name;
  String distance;
  int star;
  String img;
  Items({this.name, this.distance, this.star, this.img});
}
