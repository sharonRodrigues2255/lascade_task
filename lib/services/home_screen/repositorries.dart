import 'package:dio/dio.dart';
import 'package:lascade_task/core/appurls/appurls.dart';
import 'package:lascade_task/core/exception/app_exception.dart';
import 'package:lascade_task/models/product_model.dart';

import '../../core/Network/HttpRequest.dart';

class HomeRepository {
 NetworkApiService apiService = NetworkApiService();
  CancelToken? cancelToken;

Future<List<ProductModel>> fetchProducts() async {
  cancelToken = CancelToken();
  try {
    var response = await apiService.getAPIResponse(
      AppUrls.products,
      null,
      cancelToken,
    );

    if (response.success != null) {
      final List<dynamic> jsonList = response.success!.response.data;
      final List<ProductModel> products =
          jsonList.map((json) => ProductModel.fromJson(json)).toList();

      return products;
    } else {
      throw AppException(
          response.fail?.message.toString() ?? "Unknown error", 'products');
    }
  } catch (e) {
    throw AppException(e.toString(), 'Network');
  }
}

Future<List<String>> fetchCategories() async {
  cancelToken = CancelToken();
  try {
    var response = await apiService.getAPIResponse(
      AppUrls.categories,
      null,
      cancelToken,
    );

    if (response.success != null) {
      final List<dynamic> jsonList = response.success!.response.data;
      final List<String> categories = jsonList.map((e) => e.toString()).toList();

      return categories;
    } else {
      throw AppException(
          response.fail?.message.toString() ?? "Unknown error", 'categories list');
    }
  } catch (e) {
    throw AppException(e.toString(), 'Network');
  }
}

  }
