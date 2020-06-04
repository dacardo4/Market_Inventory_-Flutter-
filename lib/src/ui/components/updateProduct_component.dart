import 'package:flutter/material.dart';
import 'package:market_inventory/src/models/quantity.dart';
import 'package:market_inventory/src/providers/product_provider.dart';
import 'package:market_inventory/src/styles/colors.dart';
import 'package:market_inventory/src/ui/widgets/text_widget.dart';
import 'package:market_inventory/src/utils/alerts.dart';

class UpdateProductComponent extends StatefulWidget {
  Quantity quantityProduct;
  UpdateProductComponent ({ Key key, this.quantityProduct }): super(key: key);

  @override
  _UpdateProductComponentState createState() => _UpdateProductComponentState(quantityProduct);
}

class _UpdateProductComponentState extends State<UpdateProductComponent> {
  Quantity quantityProduct2;
  _UpdateProductComponentState (this.quantityProduct2);
  int _productInStock = 0;
  int _producToBuy = 0;
  String _productNameStr = "";
  TextEditingController _productName = TextEditingController();
  BuildContext generalContext;
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    generalContext = context;
    if (!updated) {
      _productInStock = quantityProduct2.quantityInStock;
      _producToBuy = quantityProduct2.quantityToBuy;
      _productName.text = quantityProduct2.product.productName;
      _productNameStr = quantityProduct2.product.productName;
      updated = true;
    }
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 80),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              textTittle('$_productNameStr'),
              stockInput(),
              toBuyInput(),
              actionButtons()
            ],
          ),
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
            tittleButtons('Stock:'),
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
            tittleButtons('Comprar:'),
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

  Widget textTittle(String tittle) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          genericText(tittle+" ", MyColors.widgetTextTitle, FontWeight.w700, 40),
          InkWell(
            onTap: () async {
              _productNameStr = await _asyncInputDialog(generalContext);
              updateState();
            },
            child: Icon(
              Icons.edit,
              color: MyColors.widgetTextTitle,
            ),
          ),
        ],
      ),
    );
  }

  Widget tittleButtons(String text) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: genericText(text, MyColors.widgetTextSubtitle, FontWeight.normal, 30),
    );
  }

  Widget actionButtons() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: RaisedButton(
          onPressed: (){},//_sendData,
          child: Text('Actualizar'),
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

  Future<String> _asyncInputDialog(BuildContext context) async {
    TextEditingController controlador = TextEditingController();
    controlador.text = _productNameStr;
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingresa el nuevo nombre'),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                    controller: controlador,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nombre del Producto'
                    ),
                    onChanged: (value) {
                      teamName = value;
                    },
                )
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(controlador.text);
              },
            ),
          ],
        );
      },
    );
  }

}