import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:timbu/app/app.locator.dart';
import 'package:timbu/app/app.logger.dart';
import 'package:timbu/model/product.dart';
import 'package:timbu/utilities/products_api.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends FutureViewModel {
  final log = getLogger('HomeViewModel');

  final _productService = locator<ProductService>();

  Product? product;
  // Product _product;
  // List<Product> get product => _product;

  Future<Product> getproductss() async {
    // try {
    Product result = await _productService.getProducts();

    product = result;
    print(product);

    return Future.value(product);
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }

  @override
  Future futureToRun() => getproductss();
}
