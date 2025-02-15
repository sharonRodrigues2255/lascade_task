import 'package:flutter/material.dart';
import 'package:lascade_task/models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  List<ProductModel> filteredProducts = [];



  void searchProducts(String query, List<ProductModel> allProducts) {
    if (query.isEmpty) {
      filteredProducts = [];
    } else {
      String cleanQuery = query.toLowerCase();
      filteredProducts = allProducts
          .where((product) =>
              (product.title ?? "").toLowerCase().contains(cleanQuery))
          .toList();
    }
    notifyListeners();
  }
}
