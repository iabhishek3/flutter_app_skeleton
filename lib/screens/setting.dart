

import 'package:flutter/material.dart';
import '../routes/drawerconfig.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:MyDrawer(),
        appBar: AppBar(
            title: Text("Settings", style: TextStyle(fontSize: 24)),
            centerTitle: false,
            backgroundColor: Colors.indigo
        ),
        body: Text(
            "Settings screen"
        )
    );
  }
}