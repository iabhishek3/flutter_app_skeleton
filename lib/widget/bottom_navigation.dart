import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {

  String name;
  Function Dataset;
  BottomNav(name, Dataset) {
    this.name = name;
    this.Dataset = Dataset;
  }
  @override
  _BottomNavState createState() => _BottomNavState(this.name, this.Dataset);
}

class _BottomNavState extends State<BottomNav> with SingleTickerProviderStateMixin {
  
  
  int currentTab = 0;
  String name;
  Function dataset;
  _BottomNavState(name, dataset) {
    this.name = name;
    this.dataset = dataset;
  }

  @override
  void initState() {
    super.initState();
  }
  final List colorsList = [
    Colors.indigo,
    Colors.indigo,
    Colors.indigo,
    Colors.indigo
  ];
  void _onItemTapped(int index) {
    this.dataset(index);
    setState(() {
      currentTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: colorsList[currentTab],
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    this._onItemTapped(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: currentTab == 0 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    this._onItemTapped(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: currentTab == 1 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Health',
                        style: TextStyle(
                          color: currentTab == 1 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Right Tab bar icons

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    this._onItemTapped(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: currentTab == 2 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: currentTab == 2 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    this._onItemTapped(3);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: currentTab == 3 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: currentTab == 3 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
