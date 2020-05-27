import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:market_inventory/src/providers/quantity_provider.dart';
import 'package:market_inventory/src/utils/constants.dart';

class _ProductProvider {
  List<dynamic> data = [];
  Map<String, dynamic> postData;

  Future<List<dynamic>> getAllProducts() async {
    final answer = await http.get(Constants.urlBack+'products');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }

  Future<Map<String, dynamic>> postProducts(String productName, int idUser, int idCategory, int idSubcategory, int quantityInStock, int quantityToBuy) async {
    final answer = await http.post(Constants.urlBack+'products',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "productName": productName,
        "idUser": idUser,
      }),
    );
    if (answer.statusCode == 200) {
      postData = json.decode(answer.body);
      quantityProvider.postQuantityData(postData['id'], quantityInStock, quantityToBuy, idUser);
    } else print('Status Error no 200');
    return postData;
  }
}
final productProvider = new _ProductProvider();