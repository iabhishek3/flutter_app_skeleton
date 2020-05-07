

import 'package:flutter/material.dart';
import '../routes/drawerconfig.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        drawer:MyDrawer(),
        appBar: AppBar(
            title: Text("Profile ", style: TextStyle(fontSize: 24)),
            centerTitle: false,
            backgroundColor: Colors.indigo
        ),
        body: Text(
            "Profile screen"
        )
    );
  }
}