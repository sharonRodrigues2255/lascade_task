import 'package:flutter/material.dart';
import 'package:lascade_task/core/exception/app_exception.dart';
import 'package:lascade_task/services/home_screen/repositorries.dart';

import '../../models/product_model.dart';


class HomeScreenAsyncProvider extends ChangeNotifier {
  List<ProductModel>? products;
  bool isLoading = false; 

  Future<List<ProductModel>> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await HomeRepository().fetchProducts();
      return products!;
    } catch (e) {
      throw AppException(e.toString(), 'fetchProducts');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
