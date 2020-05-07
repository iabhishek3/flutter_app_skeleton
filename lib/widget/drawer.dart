import 'package:flutter/material.dart';
import 'package:flutter_widget/screens/docs.dart';
import 'package:flutter_widget/screens/chats.dart';
import 'package:flutter_widget/screens/profile.dart';
import 'package:flutter_widget/screens/setting.dart';
import 'package:flutter_widget/screens/login.dart';
import '../main.dart';
import '../routes/routeconfig.dart';

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
   Navigator.of(context).pushNamed('/');
                         },
                       ),
                       ListTile(
                         title: Text('Chats'),
                         onTap: () {
                       Navigator.of(context).pushNamed( '/Chat', arguments: 'Chat page', );
                         },
                       ),

                         ListTile(
                                                title: Text('Profile'),
                                                onTap: () {
                                                  Navigator.of(context).pushNamed('/Profile');
                                                },
                                              ),
  ListTile(
                         title: Text('Settings'),
                         onTap: () {
                           Navigator.of(context).pushNamed('/Settings');
                         },
                       ),
                         ListTile(
                                                title: Text('Log Out'),
                                                onTap: () {
                                                  Navigator.of(context).pushNamed('/Logout');
                                                },
                                              ),
                     ],
                   ),
                 );
  }
  }