import 'package:flutter/material.dart';
import 'package:market_inventory/src/ui/components/cardComponent.dart';
import 'package:market_inventory/src/ui/components/listComponent.dart';
import 'package:market_inventory/src/ui/components/uploadProductComponent.dart';
import 'package:market_inventory/src/widgets/checkboxlist2_widget.dart';
import 'package:market_inventory/src/widgets/checkboxlist_widget.dart';

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
    MyCheckBoxListWidget(),
    MyCheckBoxListWidget2(),
    //ListComponent(),
    UploadProductComponent(),
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
          myBottomNavigationBarItem('Inventario', Icons.apps),
          myBottomNavigationBarItem('Comprar', Icons.assignment),
          myBottomNavigationBarItem('Comprar2', Icons.assignment),
          myBottomNavigationBarItem('Registrar', Icons.backup),
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