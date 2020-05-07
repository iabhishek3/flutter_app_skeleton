import 'package:flutter/material.dart';
import 'package:flutter_widget/screens/docs.dart';
import 'package:flutter_widget/screens/profile.dart';
import './widget/bottom_navigation.dart';
import './routes/drawerconfig.dart';
import 'screens/home.dart';
import 'screens/setting.dart';
import 'screens/chats.dart';
import './routes/routeconfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int currentTab = 0;
  final List<Widget> screens = [
    GridDashboard(),
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
        title: 'Dashboard',
        home: Scaffold(
            drawer:MyDrawer(),
            appBar: AppBar(
              title: Text("Dashboard", style: TextStyle(fontSize: 24)),
              centerTitle: false,
              backgroundColor: Colors.indigo
            ),
            body: screens[currentTab],
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.person),
              onPressed: () {},
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNav("Abhishek", this.bodyDataFunc)),
        onGenerateRoute: RouteGenerator.generateRoute,
            );
  }
}

