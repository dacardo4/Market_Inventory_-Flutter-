import 'package:flutter/material.dart';
import 'package:market_inventory/src/models/quantity.dart';
import 'package:market_inventory/src/providers/product_provider.dart';
import 'package:market_inventory/src/providers/quantity_provider.dart';
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
  Quantity _quantityProduct2;
  _UpdateProductComponentState (this._quantityProduct2);
  BuildContext generalContext;
  String _productName = '';
  int _productInStock = 0;
  int _producToBuy = 0;
  bool _updatedInitialValues = true;

  @override
  Widget build(BuildContext context) {
    generalContext = context;
    if (_updatedInitialValues) {
      _productInStock = _quantityProduct2.quantityInStock;
      _producToBuy = _quantityProduct2.quantityToBuy;
      _productName = _quantityProduct2.product.productName;
      _updatedInitialValues = false;
    }
    return Scaffold(
      appBar: AppBar(title: Text('UpdatePruduct')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _textTittle(),
              _stockInput(),
              _toBuyInput(),
              _actionButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTittle() {
    Color colorToShow;
    if (_quantityProduct2.product.productName == _productName ) colorToShow = MyColors.widgetTextTitle;
    else colorToShow = MyColors.updateDataDiffValue;
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          genericText('$_productName'+' ', colorToShow, FontWeight.w700, 40),
          InkWell(
            onTap: () async {
              String _productNewName = await myGetInputDialog(generalContext, '$_productName');
              if (_productNewName == '') showMyInformationAlert(generalContext, 'emptyName');
              else {
                _productName = _productNewName;
                updateState();
              }
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

  Widget _stockInput() {
    Color colorToShow;
    if (_quantityProduct2.quantityInStock == _productInStock ) colorToShow = MyColors.updateDataSameValue;
    else colorToShow = MyColors.updateDataDiffValue;
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            genericText('Stock:     ', MyColors.widgetTextSubtitle, FontWeight.normal, 30),
            _genericButton('productStockMinus', Icons.arrow_back_ios),
            genericText('$_productInStock', colorToShow, FontWeight.normal, 20),
            _genericButton('productStockPluss', Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget _toBuyInput() {
    Color colorToShow;
    if (_quantityProduct2.quantityToBuy == _producToBuy ) colorToShow = MyColors.updateDataSameValue;
    else colorToShow = MyColors.updateDataDiffValue;
    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            genericText('Comprar:', MyColors.widgetTextSubtitle, FontWeight.normal, 30),
            _genericButton('productToBuyMinus', Icons.arrow_back_ios),
            genericText('$_producToBuy', colorToShow, FontWeight.normal, 20),
            _genericButton('productToBuyPluss', Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget _actionButtons() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: RaisedButton(
          onPressed: _sendData,
          child: Text('Actualizar'),
        ),
      ),
    );
  }

  updateState() {
    setState(() => {} );
  }
  
  Widget _genericButton(String typebtn, IconData icon) {
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
    } 
    updateState();
  }

  _sendData() async {
    Map<String, dynamic> dataProduct = {
      'id' : _quantityProduct2.product.id,
      'productName' : _productName,
    };
    Map<String, dynamic> dataQuantity = {
      'id' : _quantityProduct2.id,
      'quantityInStock' : _productInStock,
      'quantityToBuy' : _producToBuy,
    };
    bool sameName = _productName == _quantityProduct2.product.productName,
      sameQuantityBuy = _producToBuy == _quantityProduct2.quantityToBuy,
      sameQuantityStock = _productInStock == _quantityProduct2.quantityInStock,
      infoUpdated = false;
    print('dataProduct');
    print(dataProduct);
    print('dataQuantity');
    print(dataQuantity);
    if ( !sameName && (!sameQuantityBuy || !sameQuantityStock) ) {
      print('001');
      infoUpdated = await productProvider.patchProductsAndQuantity(generalContext, dataProduct, dataQuantity);
    } else if ( !sameName ) {
      print('002');
      infoUpdated = await productProvider.patchProducts(generalContext, dataProduct);
    } else if ( !sameQuantityBuy || !sameQuantityStock ) {
      print('003');
      infoUpdated = await quantityProvider.patchQuantity(generalContext, dataQuantity);
    } else showMyInformationAlert(generalContext, 'sameData');

    if (infoUpdated) {
      showMyInformationAlert(generalContext, 'patchProducts');
      _updateObject();
    }
  }

  _updateObject() {
    _quantityProduct2.product.productName = _productName;
    _quantityProduct2.quantityToBuy = _producToBuy;
    _quantityProduct2.quantityInStock = _productInStock;
    updateState();
  }

}