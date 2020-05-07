
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/drawer.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      name: "Dr Joe",
      distance : "1.2 km",
      star: 3,
      img: "assets/1.png",
      );

  Items item2 = new Items(
    name: "Dr. Harrison",
    distance: "2.0 km",
    star: 3,
     img: "assets/2.png",
  );
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
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Scaffold(
        drawer:MyDrawer(),

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

                      Text(
                        data.distance,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
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
}

class Items {
  String name;
  String distance;
  int star;
  String img;
  Items({this.name, this.distance, this.star, this.img});
}
