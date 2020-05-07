import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import '../routes/routeconfig.dart';
import '../main.dart';
class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Stack( // <-- STACK AS THE SCAFFOLD PARENT
          children: [
      Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/bg.jpg"), // <-- BACKGROUND IMAGE
    fit: BoxFit.cover,
    ),
    ),
    ),
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff21254A).withOpacity(0.9),

      body: Center(
        child: MyStatefulWidget(),
      ),

    ),
          ]
    );
  }
}


enum SingingCharacter {  PASSPORT, NRICP, NRICB, FIN }

bool monVal = false;
bool tuVal = false;
bool wedVal = false;

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.PASSPORT;
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
          child: Image.asset(
            'assets/logo.png',
            width: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),

              FadeAnimation(
                1,
                Center(
                  child: Text(
                    "Signup to continue",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              FadeAnimation(
                1,
                Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: TextField(
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: TextField(
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: TextField(
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: TextField(
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ID Number",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                  spacing: 0.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Radio(
                                      value: SingingCharacter.PASSPORT,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 17),
                                      child: Text("Passport",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)

                                      ),
                                    ),
                                  ]
                              ),
                              Wrap(
                                  spacing: 0.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Radio(
                                      value: SingingCharacter.NRICP,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Text("NRIC-P",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)

                                      ),
                                    ),
                                  ]
                              ),
                              Wrap(
                                  spacing: 0.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Radio(
                                      value: SingingCharacter.NRICB,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Text("NRIC-B",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)

                                      ),
                                    ),
                                  ]
                              ),
                              Wrap(
                                  spacing: 0.0, // gap between adjacent chips
                                  runSpacing: 0.0, // gap between lines
                                  children: <Widget>[
                                    Radio(
                                      value: SingingCharacter.FIN,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Text("FIN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)

                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attach copy of ID",
                              style: TextStyle(fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Column(
                                children: <Widget>[
                                  new IconTheme(
                                    data: new IconThemeData(color: Colors.white),
                                    child: new Icon(Icons.photo_camera, size: 80,), // I want to iterate this "star icon" for reviews.ratings.length times
                                  ),
                            Text("Take Photo",
                            style: TextStyle(color: Colors.white, fontSize: 18),),
                               SizedBox(height: 20,)
                                ],
                              ),
                            SizedBox(width: 100,),
                            Column(
                              children: <Widget>[
                                new IconTheme(
                                  data: new IconThemeData(color: Colors.white),
                                  child: new Icon(Icons.add_a_photo, size: 80,), // I want to iterate this "star icon" for reviews.ratings.length times
                                ),
                                Text("Attach Photo",
                                  style: TextStyle(color: Colors.white, fontSize: 18),),
                                SizedBox(height: 20,)
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                                spacing: 0.0, // gap between adjacent chips
                                runSpacing: 0.0, // gap between lines
                                children: <Widget>[
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 3.0, color: Colors.white),
                                        left: BorderSide(width: 3.0, color: Colors.white),
                                        right: BorderSide(width: 3.0, color: Colors.white),
                                        bottom: BorderSide(width: 3.0, color: Colors.white),
                                      ),
                                    ),
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      focusColor:Colors.white ,
                                      hoverColor: Colors.white,
                                      value: monVal,
                                      onChanged: (bool value) {
                                        setState(() {
                                          monVal = value;
                                        });
                                      },
                                    ),
                                    height: 25,
                                    width: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    child: Text("by login you agree",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16 ,
                                            fontWeight: FontWeight.w500)

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2),
                                    child: GestureDetector(
                                        child: Text(" Terms & COnditions", style: TextStyle( color: Colors.blue)),
                                        onTap: () {
                                          // do what you need to do when "Click here" gets clicked
                                        }
                                    ),
                                  )
                                ]
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              FadeAnimation(
                1,
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Logout');
                      },
                      child: new Text("Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}