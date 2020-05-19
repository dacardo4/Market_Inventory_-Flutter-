import 'package:flutter/material.dart';
import 'package:market_inventory/widgets/product-card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox( height: 20.0,),
          ProductCard(),
        ],
      ),
    );
  }
}