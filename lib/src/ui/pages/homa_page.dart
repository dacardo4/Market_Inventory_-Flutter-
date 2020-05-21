import 'package:flutter/material.dart';
import 'package:market_inventory/src/ui/components/cardComponent.dart';
import 'package:market_inventory/src/ui/components/listComponent.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    CardComponent(),
    ListComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF001A49),
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedItemColor: Color(0xFF667EAF),
        selectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: [
          myBottomNavigationBarItem('Inventario', Icons.featured_play_list),
          myBottomNavigationBarItem('Comprar', Icons.battery_unknown),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
}

myBottomNavigationBarItem(String myTitle, IconData myIcon) {
  return BottomNavigationBarItem(
    icon: Icon(myIcon),
    title: new Text(myTitle),
  );
}