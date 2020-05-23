import 'package:flutter/material.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';

class UploadProductComponent extends StatefulWidget {
  @override
  _UploadProductComponentState createState() => _UploadProductComponentState();
}

class _UploadProductComponentState extends State<UploadProductComponent> {
  int _productInStock = 0;
  int _producToBuy = 0;
  TextEditingController _productName = TextEditingController();
  //TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      width: MediaQuery.of(context).size.width,
      color: Colors.cyan,
      child: Column(
        children: <Widget>[
          nameInput(context),
          tittleButtons('Cantidad en Stock'),
          stockInput(),
          tittleButtons('Cantidad a comprar'),
          toBuyInput(),
          actionButtons()
        ],
      ),
    );
  }

  Widget nameInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
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
      //color: Colors.green,
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
      //color: Colors.yellow,
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
      fillColor: Colors.white,
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
    setState(() => {} );
  }

  void _sendData() {
    if (_productName.text == '') print('VACIO!');
    else postProductProvider.postData(_productName.text, 1, 0, 0, _productInStock, _producToBuy);
  }

}

// var details = new Map(); 
//    details['Usrname'] = 'admin'; 
//    details['Password'] = 'admin@123'; 
//    print(details); 