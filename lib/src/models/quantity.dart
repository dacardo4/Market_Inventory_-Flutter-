import 'package:market_inventory/src/models/product.dart';

class Quantity {
  int id;
  int idProduct;
  int quantityInStock;
  int quantityToBuy;
  int idUser;
  Product product;

  Quantity({data}) {
    id = data['id'] ?? null;
    idProduct = data['idProduct'] ?? null;
    quantityInStock = data['quantityInStock'] ?? null;
    quantityToBuy = data['quantityToBuy'] ?? null;
    idUser = data['idUser'] ?? null;
    product = Product.fromJson(data['product']) ?? null;
  }

  factory Quantity.fromJson(Map<String, dynamic> data) {
    return Quantity(
      data : data,
    );
  }
  
  @override
  String toString() {
    String dataToPrint = '{id: $id, idProduct: $idProduct, quantityInStock: $quantityInStock, quantityToBuy: $quantityToBuy, idUser: $idUser}\n';
    return dataToPrint;
  }
}

class Post {
  final int userId2;
  final String title;
  final String body;

  Post({this.userId2, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      //userId: json['userId'],
      userId2: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}