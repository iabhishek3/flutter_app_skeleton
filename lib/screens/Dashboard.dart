import 'package:flutter/material.dart';
import 'package:flutter_widget/routes/drawerconfig.dart';
import 'package:flutter_widget/widget/bottom_navigation.dart';
import '../routes/routeconfig.dart';
import 'chats.dart';
import 'docs.dart';
import 'profile.dart';
import 'setting.dart';
import 'splash.dart';
import 'home.dart';

class AppHome extends StatefulWidget {
  @override _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

 int currentTab = 0;
  final List<Widget> screens = [
//    GridDashboard(),
    Homepage(),
    Chats(),
   profile(),
    setting(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  String bodyDataFunc(int data) {
    setState(() {
      this.currentTab = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        home: Scaffold(
            drawer:MyDrawer(),
            appBar: AppBar(
              title: Text("Home", style: TextStyle(fontSize: 24)),
              centerTitle: true,
              backgroundColor: Colors.indigo,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                )
              ],
            ),
            body: screens[currentTab],
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.person),
              onPressed: () {},
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNav("", this.bodyDataFunc)
            
           
            
            ),
        onGenerateRoute: RouteGenerator.generateRoute,
            );
  }
}