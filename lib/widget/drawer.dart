import 'package:flutter/material.dart';
import 'package:flutter_widget/screens/docs.dart';
import 'package:flutter_widget/screens/chats.dart';
import 'package:flutter_widget/screens/profile.dart';
import 'package:flutter_widget/screens/setting.dart';
import 'package:flutter_widget/screens/login.dart';
import '../main.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
                   child: ListView(
                     padding: EdgeInsets.zero,
                     children: <Widget>[
                       DrawerHeader(
                         child:Center(
                                            child: Image.asset(
                                              'assets/logo.png',
                                              width: 100,
                                            ),
                                          ),
                         decoration: BoxDecoration(
                           color:Colors.indigo,
                         ),

                       ),
                       ListTile(
                         title: Text('Dashboard'),
                         onTap: () {

                           //Navigator.pop(context);
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => MyApp()));
                         },
                       ),
                       ListTile(
                         title: Text('Chats'),
                         onTap: () {
                           // Update the state of the app
                           // ...
                           // Then close the drawer
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Chats()));
                         },
                       ),

                         ListTile(
                                                title: Text('Profile'),
                                                onTap: () {
                                                  // Update the state of the app
                                                  // ...
                                                  // Then close the drawer
                                                  Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => profile()));
                                                },
                                              ),
  ListTile(
                         title: Text('Settings'),
                         onTap: () {
                           // Update the state of the app
                           // ...
                           // Then close the drawer
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => setting()));
                         },
                       ),
                         ListTile(
                                                title: Text('Log Out'),
                                                onTap: () {
                                                  // Update the state of the app
                                                  // ...
                                                  // Then close the drawer
                                                  Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => LoginPage()));
                                                },
                                              ),
                     ],
                   ),
                 );
  }
  }