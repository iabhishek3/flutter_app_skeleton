import 'package:flutter/material.dart';
import 'package:myvcapp/screens/docs.dart';
import 'package:myvcapp/screens/chats.dart';
import 'package:myvcapp/screens/profile.dart';
import 'package:myvcapp/screens/setting.dart';
import 'package:myvcapp/screens/login.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../routes/routeconfig.dart';

import '../blocs/user_infromation_bloc.dart';

class MyDrawer extends StatefulWidget {



  
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
            Consumer<UserInformation>(
              builder: (context,data,child){
                print("object"+data.toString());
                return  Text(  data.userinfo['name']+ '| 29 M',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white )
              );
              },
                                
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