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
            child:Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/1.png'),
                            fit: BoxFit.cover),
                        borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ]),
                  ),
                ),
                SizedBox(height: 10,),
                Text(' Hi Anil | 29 M',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white )
                )

              ],
            ),
            decoration: BoxDecoration(
              color:Colors.indigo,
            ),

          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pushNamed('/AppHome');
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