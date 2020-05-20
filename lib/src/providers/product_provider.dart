import 'dart:convert';
import 'package:http/http.dart' as http;

/// 1e96fc
/// ffa9e7
/// 473bf0
/// ff84e8
/// 414361
final String url = '';

class _ProductProvider {
  List<dynamic> data = [];

  _ProductProvider() {
    getData();
  }

  Future<List<dynamic>> getData() async {
    final answer = await http.get('https://market-inventory.herokuapp.com/api/products');
    if (answer.statusCode == 200) {
      data = json.decode(answer.body);
    } else {
      print('Status Error no 200');
    }
    return data;
  }
}

final productProvider = new _ProductProvider();