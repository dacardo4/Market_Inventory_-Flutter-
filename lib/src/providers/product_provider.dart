import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'package:market_inventory/src/utils/alerts.dart';
import 'package:market_inventory/src/utils/constants.dart';

class _ProductProvider {
  static const String localUrl = Constants.urlBack+'products';
  List<dynamic> data = [];
  Map<String, dynamic> postData;
  BuildContext generalContext;

  Future<List<dynamic>> getAllProducts(BuildContext context) async {
    generalContext = context;
    final answer = await http.get(localUrl);
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else {
      data = [];
      showMyInformationAlert(generalContext, 'error');
    }
    return data;
  }

  Future<bool> postProducts(BuildContext context, String productName, int idUser, int idCategory, int idSubcategory, int quantityInStock, int quantityToBuy) async {
    generalContext = context;
    bool postQtyOk = false, istOk = false;
    final answer = await http.post(
      localUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "productName": productName,
        "idUser": idUser,
      }),
    );
    if (answer.statusCode == 200) {
      istOk = true;
      postData = json.decode(answer.body);
      postQtyOk = await quantityProvider.postQuantityData(generalContext, postData['id'], quantityInStock, quantityToBuy, idUser);
    } else showMyInformationAlert(generalContext, 'error');
    return (postQtyOk && istOk) ? true : false;
  }
}
final productProvider = new _ProductProvider();