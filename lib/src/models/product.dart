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

  Product(data) {
    id = data['id'] ? data['id'] : null;
    productName = data['productName'] ? data['productName'] : null;
    idUser = data['idUser'] ? data['idUser'] : null;
    idCategory = data['idCategory'] ? data['idCategory'] : null;
    idSubcategory = data['idSubcategory'] ? data['idSubcategory'] : null;
    quantities = data['quantities'] ? data['quantities'] : null;
  }
}