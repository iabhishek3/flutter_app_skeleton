import 'package:flutter/material.dart';
import '../widget/drawer.dart';
class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:MyDrawer(),
    appBar: AppBar(
    title: Text("Chat ", style: TextStyle(fontSize: 24)),
    centerTitle: false,
    backgroundColor: Colors.indigo
    ),
    body: Text(
      "chat screen"
    )
    );
  }
}