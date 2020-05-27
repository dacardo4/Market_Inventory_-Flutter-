import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:market_inventory/src/utils/constants.dart';

class _QuantityProvider {
  List<dynamic> data = [];
  Map<String, dynamic> postData;

  _QuantityProvider();

  Future<List<dynamic>> getAllQuantityData() async {
    final answer = await http.get(Constants.urlBack+'quantities'+'?filter={"include":"product"}');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }

  Future<List<dynamic>> getQuantityShoppingList() async {
    final answer = await http.get(Constants.urlBack+'quantities/shoppingList');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }

  Future<Map<String, dynamic>> postQuantityData(int idProduct, int quantityInStock, int quantityToBuy, int idUser) async {
    final answer = await http.post(Constants.urlBack+'quantities',
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
    if (answer.statusCode == 200) postData = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return postData;
  }
}
final quantityProvider = new _QuantityProvider();