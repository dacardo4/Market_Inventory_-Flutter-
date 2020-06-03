import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'package:market_inventory/src/styles/colors.dart';

class ListComponent extends StatelessWidget {
  BuildContext generalContext;
  @override
  Widget build(BuildContext context) {
    generalContext = context;
    return Center(
      child: _myList(),
    );
  }

  Widget _myList() {
    return FutureBuilder(
      future: quantityProvider.getQuantityShoppingList(generalContext),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemsList(snapshot.data, context),
        );
      },
    );
  }

  String name = '';

  List<Widget> _itemsList( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];
    data.forEach( (opt) {
      name = opt['quantityToBuy'].toString() + ' - ' + opt['product']['productName'];
      final contTemp = Container(
        height: 50,
        color: MyColors.containerBackgroud,
        child: Center(
          child: Text(
            "$name",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20,
            )
          ),
        ),
      );
      opciones..add(contTemp)
              ..add(Divider());
    });
    return opciones;
  }
}