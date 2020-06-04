import 'package:market_inventory/src/models/quantity.dart';

class Product {
  int id;
  String productName;
  int idUser;
  int idCategory;
  int idSubcategory;
  Quantity quantities;

  String get getProductName { 
    return productName; 
  } 
  
  set setProductName(String productName) { 
    this.productName = productName; 
  }

  Product({data}) {
    id = data['id'] ?? null;
    productName = data['productName'] ?? null;
    idUser = data['idUser'] ?? null;
    idCategory = data['idCategory'] ?? null;
    idSubcategory = data['idSubcategory'] ?? null;
    quantities = data['quantities'] ?? null;
  }

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      data : data,
    );
  }

  @override
  String toString() {
    String dataToPrint = '{id: $id, productName: $productName, idUser: $idUser, idCategory: $idCategory, idSubcategory: $idSubcategory}';//\n
    return dataToPrint;
  }
}