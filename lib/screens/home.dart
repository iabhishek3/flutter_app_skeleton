import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/drawerconfig.dart';
import 'package:google_fonts/google_fonts.dart';
class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      backgroundColor: Colors.grey[100].withOpacity(0.9),
        drawer:MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(' Hello! Anil',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, )
                  )
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 20),
                  child: Text('Welcome to Healthway Medical',
                      style: TextStyle(fontSize: 22)
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 130,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              child:   Image.asset( 'assets/doctor.jpg',
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 240,
                            child: Text('Speak to our Online GP DOctors',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Doctors');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 50,
                            child: Icon(Icons.arrow_forward, size: 50,)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 130,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              child:   Image.asset( 'assets/docs.png',
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 240,
                            child: Text('My Documents',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Doctors');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 50,
                            child: Icon(Icons.arrow_forward, size: 50,)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 130,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            child:   Image.asset( 'assets/prescription.png',
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 240,
                            child: Text('Prescription',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Doctors');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 50,
                            child: Icon(Icons.arrow_forward, size: 50,)
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
    );
  }
}