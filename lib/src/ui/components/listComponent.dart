import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'package:market_inventory/src/ui/components/cardComponent.dart';
import 'package:market_inventory/src/widgets/product-card.dart';

class ListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _myList(),
    );
  }

  Widget _myList() {
    return FutureBuilder(
      //future: productProvider.getData(),
      future: getQuantityshoppingListProvider.getData(),
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
      final widgetTemp = Container(
        height: 50,
        color: Colors.amber[100],
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
      ProductCard(
        nameProduct: opt['product']['productName'],
        quantityStockProduct: opt['quantityInStock'],
        quantityBuyProduct: opt['quantityToBuy']
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    // opciones..add(Container(
    //                 height: 50,
    //                 color: Colors.amber[600],
    //                 child: const Center(child: Text('Entry A')),
    //               )
    //             )
    //         ..add(Container(
    //                 height: 50,
    //                 color: Colors.amber[500],
    //                 child: const Center(child: Text('Entry B')),
    //               )
    //             )
    //         ..add(Container(
    //             height: 50,
    //             color: Colors.amber[100],
    //             child: const Center(child: Text('Entry C')),
    //           ),
    //         );
    return opciones;
  }
}