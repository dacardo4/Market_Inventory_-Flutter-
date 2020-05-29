import 'package:market_inventory/src/models/product.dart';

class Quantity {
  int id;
  int idProduct;
  int quantityInStock;
  int quantityToBuy;
  int idUser;
  Product relations;

  Quantity(data) {
    id = data['id'] ? data['id'] : null;
    idProduct = data['idProduct'] ? data['idProduct'] : null;
    quantityInStock = data['quantityInStock'] ? data['quantityInStock'] : null;
    quantityToBuy = data['quantityToBuy'] ? data['quantityToBuy'] : null;
    idUser = data['idUser'] ? data['idUser'] : null;
    relations = data['relations'] ? data['relations'] : null;
  }
}