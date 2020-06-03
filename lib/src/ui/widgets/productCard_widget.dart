import 'package:flutter/material.dart';
import 'package:market_inventory/src/models/quantity.dart';
import 'package:market_inventory/src/styles/colors.dart';
import 'package:market_inventory/src/ui/widgets/text_widget.dart';

class ProductCard extends StatelessWidget {
  Quantity quantityProduct;
  // final String nameProduct;
  // final int quantityStockProduct;
  // final int quantityBuyProduct;
  ProductCard({this.quantityProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: informationSection(),
          ),
          buttonsSection(),
        ],
      ),
    );
  }

  Widget informationSection() {
    return Row(
      children: <Widget>[
        imageExpanded(),
        infoExpanded(),
      ],
    );
  }

  Widget imageExpanded() {
    return Expanded(
      flex: 3,
      child: FadeInImage(
        //image: NetworkImage('https://www.caracteristicas.co/wp-content/uploads/2018/10/galaxias-origen-e1538505946757.jpg'),
        image: AssetImage('assets/original.gif'),
        placeholder: AssetImage('assets/original.gif'),
        fadeInDuration: Duration( milliseconds: 200),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }
  
  Widget infoExpanded() {
    return Expanded(
      flex: 7,
      child: Container(
        //height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            genericText(quantityProduct.product.productName, MyColors.widgetTextTitle, FontWeight.w900, 40.0),
            Text(''),
            genericText('Stock: ${quantityProduct.quantityInStock}', MyColors.widgetTextSubtitle, FontWeight.normal, 20.0),
            genericText('Comprar: ${quantityProduct.quantityToBuy}', MyColors.widgetTextSubtitle, FontWeight.normal, 20.0),
          ],
        ),
      ),
    );
  }

  Widget buttonsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Editar Alert'),
        ),
        FlatButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
      ],
    );
  }
}

