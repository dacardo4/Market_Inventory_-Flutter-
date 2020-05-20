import 'dart:convert';
import 'package:http/http.dart' as http;

class _QuantityProvider {
  List<dynamic> data = [];

  _QuantityProvider() {
    getData();
  }

  Future<List<dynamic>> getData() async {
    final answer = await http.get('https://market-inventory.herokuapp.com/api/quantities?filter={"include":"product"}');
    if (answer.statusCode == 200) {
      data = json.decode(answer.body);
    } else {
      print('Status Error no 200');
    }
    return data;
  }
}

final quantityProvider = new _QuantityProvider();