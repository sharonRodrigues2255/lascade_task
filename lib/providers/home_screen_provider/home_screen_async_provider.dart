import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lascade_task/services/home_screen/repositorries.dart';

import '../../models/product_model.dart';

class HomeScreenAsyncProvider extends ChangeNotifier {
  List<ProductModel>? products;
  List<ProductModel> favorites=[];
  List<String>? categories;
  String selectedCategory = "";
  String? productError;
  String? categoriesError;
  bool isLoading = false;
  bool isCategoriesLoading = false;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await HomeRepository().fetchProducts();
    } catch (e) {
      productError = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addAndRemoveFavorites(ProductModel product) {
  
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else{
 favorites.add(product);
    }
   
    notifyListeners();
  }

void seleectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      isCategoriesLoading = true;
      notifyListeners();
      categories = await HomeRepository().fetchCategories();
      selectedCategory = categories![0];
      log(categories.toString());
    } catch (e) {
      categoriesError = e.toString();
      notifyListeners();
    } finally {
      isCategoriesLoading = false;
      notifyListeners();
    }
  }
}
