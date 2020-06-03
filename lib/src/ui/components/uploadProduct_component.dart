import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/product_provider.dart';
import 'package:market_inventory/src/styles/colors.dart';
import 'package:market_inventory/src/utils/alerts.dart';

class UploadProductComponent extends StatefulWidget {
  @override
  _UploadProductComponentState createState() => _UploadProductComponentState();
}

class _UploadProductComponentState extends State<UploadProductComponent> {
  int _productInStock = 0;
  int _producToBuy = 0;
  TextEditingController _productName = TextEditingController();
  BuildContext generalContext;

  @override
  Widget build(BuildContext context) {
    generalContext = context;
    return Container(
      padding: EdgeInsets.only(top: 80),
      width: MediaQuery.of(context).size.width,
      color: MyColors.containerBackgroud2,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            nameInput(),
            tittleButtons('Cantidad en Stock'),
            stockInput(),
            tittleButtons('Cantidad a comprar'),
            toBuyInput(),
            actionButtons()
          ],
        ),
      ),
    );
  }

  Widget nameInput() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      color: MyColors.generalWhite,
      width: MediaQuery.of(generalContext).size.width,
      child: TextField(
        controller: _productName,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingresa el nombre del producto'
        ),
      ),
    );
  }

  Widget stockInput() {
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            genericButton('productStockMinus', Icons.arrow_back_ios),
            Text('$_productInStock'),
            genericButton('productStockPluss', Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget toBuyInput() {
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            genericButton('productToBuyMinus', Icons.arrow_back_ios),
            Text('$_producToBuy'),
            genericButton('productToBuyPluss', Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget genericButton(String typebtn, IconData icon) {
    return RawMaterialButton(
      onPressed: (){ _updateData(typebtn); },
      elevation: 2.0,
      fillColor: MyColors.generalWhite,
      child: Icon(
        icon,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }

  Widget tittleButtons(String tittle) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        tittle,
        style: TextStyle(
          fontSize: 20,
        ),
      )
    );
  }

  Widget actionButtons() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: RaisedButton(
          onPressed: _sendData,
          child: Text('Guardar'),
        ),
      ),
    );
  }

  void _updateData(String opt) {
    switch(opt) { 
      case 'productStockMinus': { 
        if (_productInStock <= 0) _productInStock = 0;
        else _productInStock--;
      } break; 
      case 'productStockPluss': { 
        _productInStock++;
      } break; 
      case 'productToBuyMinus': { 
        if (_producToBuy <= 0) _producToBuy = 0;
        else _producToBuy--;
      } break; 
      case 'productToBuyPluss': { 
        _producToBuy++;
      } break; 
      default: { 
          //statements;  
      }
      break; 
    } 
    updateState();
  }

  _sendData() async {
    if (_productName.text == '') print('VACIO!');
    else {
      bool productSaved = await productProvider.postProducts(generalContext, _productName.text, 1, 0, 0, _productInStock, _producToBuy);
      if (productSaved) cleanForm();
    }
  }

  cleanForm() {
    showMyInformationAlert(generalContext, 'postProducts');
    _productName.text = '';
    _productInStock = 0;
    _producToBuy = 0;
    updateState();
  }

  updateState() {
    setState(() => {} );
  }

}