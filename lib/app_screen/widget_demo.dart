import 'package:flutter/material.dart';
import 'package:myvcapp/widget/bottom_navigation.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  String bodyDataFunc(int data) {
    setState(() {
      // this.currentTab = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   leading: const Icon(Icons.short_text),
          //   title: Text("App header"),
          //   backgroundColor: Colors.indigo,
          //   centerTitle: false,
          //   actions: <Widget>[Icon(Icons.settings_applications)
          //   ],
          // ),

          backgroundColor: Colors.white,
           floatingActionButton: FloatingActionButton(
              child: Icon(Icons.person),
              onPressed: () {},
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
          body: WidgetBody("Hi Bro test3  ", age: "hhh"),
           bottomNavigationBar: BottomNav("Abhishek", this.bodyDataFunc),
        ));
  }
}

class WidgetBody extends StatelessWidget {
  String bodyText;
  String gg;
  String age;

  WidgetBody(this.bodyText, {this.age});

  @override
  Widget build(BuildContext context) {
    return 
       Column(
      children: <Widget>[
        WhatToLearn(),
        Expanded(
          child: Container(
            child:EduCationList() ,
          ),
        )
        

        // StudyWidgetList(Colors.teal[800]),
      ],
    );

    // return Container(
    //     margin: EdgeInsets.only(top: 100.0,left: 40.0),
    //     height: 50.0,
    //     width: 300.0,
    //     padding: EdgeInsets.only(left:10.0),
    //     color: Colors.lightGreen,
    //     child: Text("Hi Sam",style:TextStyle(fontSize: 30,fontWeight: FontWeight.normal))
    // );
  }
}

class WhatToLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      color: Colors.lightBlue[700],
      padding: EdgeInsets.only(left: 20.0, top: 35.0),
      child: Row(
        children: <Widget>[
          Container(
              width: 220.0,
              child: Text("Hi ,What would you like to learn Toaday ?",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          Container(
            width: 160.0,
            child: Image(image: AssetImage("assets/images/edu.png")),
          ),
        ],
      ),
    );
  }
}

class StudyWidgetList extends StatelessWidget {
  Color color;

  StudyWidgetList(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: 380.0,
      padding: EdgeInsets.only(left: 15.0),
      //  color: Colors.cyan[600],
      margin: EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),

      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 140.0,
            child: Text(
              "DNA Generic Testig",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}

class EduCationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
 MediaQuery.removePadding( 
    context: context,
    removeTop: true,
    child: 
     ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
    reverse: true,
      children: <Widget>[
        StudyWidgetList(Colors.cyan[600]),
        StudyWidgetList(Colors.orange[600]),
        StudyWidgetList(Colors.indigo),
         StudyWidgetList(Colors.indigo),
        // StudyWidgetList(Colors.greenAccent),
      ],
    )
    );

  
   
  }
}
