import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:market_inventory/src/utils/constants.dart';

class _QuantityProvider {
  static const String localUrl = Constants.urlBack+'quantities';
  List<dynamic> data = [];
  Map<String, dynamic> postData;

  _QuantityProvider();

  Future<List<dynamic>> getAllQuantityData() async {
    final answer = await http.get(localUrl+'?filter={"include":"product"}');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }

  Future<List<dynamic>> getQuantityShoppingList() async {
    final answer = await http.get(localUrl+'/shoppingList');
    if (answer.statusCode == 200) data = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return data;
  }

  Future<Map<String, dynamic>> postQuantityData(int idProduct, int quantityInStock, int quantityToBuy, int idUser) async {
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
    if (answer.statusCode == 200) postData = json.decode(answer.body);
    else  data = []; //print('Status Error no 200');
    return postData;
  }
}
final quantityProvider = new _QuantityProvider();

// Widget myAlert() {
//   return AlertDialog(
//     title: Text('AlertDialog Title'),
//     content: SingleChildScrollView(
//       child: ListBody(
//         children: <Widget>[
//           Text('This is a demo alert dialog.'),
//           Text('Would you like to approve of this message?'),
//         ],
//       ),
//     ),
//     actions: <Widget>[
//       FlatButton(
//         child: Text('Approve'),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//     ],
//   );
// }


// Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }