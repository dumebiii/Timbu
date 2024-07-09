import 'package:timbu/model/product.dart';

abstract class Products {
  Future<Product> getProducts();
}
