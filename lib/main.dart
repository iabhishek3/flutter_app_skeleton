import 'package:flutter/material.dart';
import 'package:flutter_widget/screens/docs.dart';
import './widget/bottom_navigation.dart';
import 'screens/home.dart';
import 'screens/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int currentTab = 0;
  final List<Widget> screens = [
    GridDashboard(),
    home(),
    
    setting(),
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
        title: 'Flutter Widget',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Widget", style: TextStyle(fontSize: 24)),
              centerTitle: false,
              backgroundColor: Colors.indigo,
              leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.pink,
                tooltip: 'Navigation menu',
                onPressed: null,
              ),
            ),
            body: screens[currentTab],
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.person),
              onPressed: () {},
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNav("Abhishek", this.bodyDataFunc)) 
            );
  }
}
