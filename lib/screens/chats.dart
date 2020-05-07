import 'package:flutter/material.dart';
import '../routes/drawerconfig.dart';
class Chats extends StatelessWidget {
  final String data;
  Chats({
    Key key,
    @required this.data,
}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:MyDrawer(),
    appBar: AppBar(
    title: Text("chats", style: TextStyle(fontSize: 24)),
    centerTitle: false,
    backgroundColor: Colors.indigo
    ),
    body: Text(
     this.data
    )
    );
  }
}