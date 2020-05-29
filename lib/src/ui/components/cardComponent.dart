import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'package:market_inventory/src/ui/widgets/productCard_widget.dart';

class CardComponent extends StatelessWidget {
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
      future: quantityProvider.getAllQuantityData(generalContext),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemsList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _itemsList( List<dynamic> inventory, BuildContext context ) {
    final List<Widget> opciones = [];
    inventory.forEach( (quantityProduct) {
      final widgetTemp = ProductCard(quantityProduct: quantityProduct);
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }

}