
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myvcapp/blocs/user_infromation_bloc.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//     Timer(Duration(seconds: 1), () => Navigator.of(context).pushNamed('/AppHome'));
    Timer(Duration(seconds: 1), () => Navigator.of(context).pushNamed('/Logout'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.lightBlue[900]),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue[900],
                    radius: 50.0,
                    child: Image.asset(
            'assets/Lgo2.png',
            width: 100,
          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    "HealthWay Medical",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  "GP App",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      )
    ],
        ),
      );
  }
}
