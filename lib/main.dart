import 'package:flutter/material.dart';
import 'package:market_inventory/src/ui/pages/homa_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Market',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      color: Colors.blue,
    );
  }
}