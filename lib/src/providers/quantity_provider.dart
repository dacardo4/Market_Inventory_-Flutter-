import 'dart:convert';
import 'package:http/http.dart' as http;

class _GetQuantityProvider {
  List<dynamic> data = [];

  _GetQuantityProvider() {
    //getData();
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
final getQuantityProvider = new _GetQuantityProvider();



class _GetQuantityshoppingListProvider {
  List<dynamic> data = [];

  _GetQuantityshoppingListProvider() {
    //getData();
  }

  Future<List<dynamic>> getData() async {
    final answer = await http.get('https://market-inventory.herokuapp.com/api/quantities/shoppingList');
    if (answer.statusCode == 200) {
      data = json.decode(answer.body);
    } else {
      print('Status Error no 200');
    }
    return data;
  }
}
final getQuantityshoppingListProvider = new _GetQuantityshoppingListProvider();



class _PostProductProvider {
  Map<String, dynamic> data;

  _PostProductProvider() {
    //postData();
  }

  Future<Map<String, dynamic>> postData(String productName, int idUser, int idCategory, int idSubcategory, int quantityInStock, int quantityToBuy) async {
    final answer = await http.post('https://market-inventory.herokuapp.com/api/products',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "productName": productName,
        "idUser": idUser,
      }),
      // body: jsonEncode(<String, dynamic>{
      //   "productName": productName,
      //   "idUser": idUser,
      //   "idCategory": idCategory,
      //   "idSubcategory": idSubcategory
      // }),
    );
    if (answer.statusCode == 200) {
      data = json.decode(answer.body);
      print(data['id']);
      print('data--------------------------------------------');
      print(data);
      print('================================================');
      //if (data['id']) 
      postQuantityProvider.postData(data['id'], quantityInStock, quantityToBuy, idUser);
      //else print('No hay ID de producto');
    } else {
      print('Status Error no 200');
    }
    return data;
  }

  // Future<Map<String, dynamic>> postData(int idProduct, int quantityInStock, int quantityToBuy, int idUser) async {
  //   final answer = await http.post('https://market-inventory.herokuapp.com/api/quantities',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "idProduct": idProduct,
  //       "quantityInStock": quantityInStock,
  //       "quantityToBuy": quantityToBuy,
  //       "idUser": idUser
  //     }),
  //   );
  //   if (answer.statusCode == 200) {
  //     data = json.decode(answer.body);
  //     print('data--------------------------------------------');
  //     print(data);
  //   } else {
  //     print('Status Error no 200');
  //   }
  //   return data;
  // }
}
final postProductProvider = new _PostProductProvider();




class _PostQuantityProvider {
  Map<String, dynamic> data;

  _PostQuantityProvider() {
    //postData();
  }

  Future<Map<String, dynamic>> postData(int idProduct, int quantityInStock, int quantityToBuy, int idUser) async {
    final answer = await http.post('https://market-inventory.herokuapp.com/api/quantities',
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
      data = json.decode(answer.body);
      print('data--------------------------------------------');
      print(data);
    } else {
      print('Status Error no 200');
    }
    return data;
  }
}
final postQuantityProvider = new _PostQuantityProvider();