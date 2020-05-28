import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:market_inventory/src/utils/alerts.dart';
import 'package:market_inventory/src/utils/constants.dart';

class _QuantityProvider {
  static const String localUrl = Constants.urlBack+'quantities';
  List<dynamic> data = [];
  Map<String, dynamic> postData;
  BuildContext generalContext;

  Future<List<dynamic>> getAllQuantityData(BuildContext context) async {
    generalContext = context;
    final answer = await http.get(localUrl+'?filter={"include":"product"}');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else {
      data = [];
      showMyInformationAlert(generalContext, 'error');
    }
    return data;
  }

  Future<List<dynamic>> getQuantityShoppingList(BuildContext context) async {
    generalContext = context;
    final answer = await http.get(localUrl+'/shoppingList');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else {
      data = [];
      showMyInformationAlert(generalContext, 'error');
    }
    return data;
  }

  Future<Map<String, dynamic>> postQuantityData(BuildContext context, int idProduct, int quantityInStock, int quantityToBuy, int idUser) async {
    generalContext = context;
    final answer = await http.post(
      localUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "idProduct": idProduct,
        "quantityInStock": quantityInStock,
        "quantityToBuy": quantityToBuy,
        "idUser": idUser
      }),
    );
    if (answer.statusCode == 200) {
      postData = json.decode(answer.body);
      showMyInformationAlert(generalContext, 'postProducts');
    } else {
      data = [];
      showMyInformationAlert(generalContext, 'error');
    }
    return postData;
  }
}
final quantityProvider = new _QuantityProvider();