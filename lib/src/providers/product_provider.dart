import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:market_inventory/src/utils/constants.dart';

class _ProductProvider {
  List<dynamic> data = [];

  _ProductProvider();

  Future<List<dynamic>> getAllProducts() async {
    final answer = await http.get(Constants.urlBack+'products');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }
}
final productProvider = new _ProductProvider();