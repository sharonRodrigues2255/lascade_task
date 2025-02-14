import 'dart:developer';

import 'package:lascade_task/core/Observers/DioObserver.dart';
import 'package:lascade_task/core/appurls/appurls.dart';
import 'package:lascade_task/core/helpers/Records.dart';

import 'PartsAndExceptions/BaseApiServices.dart';
import 'package:dio/dio.dart';

class NetworkApiService extends BaseApiServices {
  final dio = Dio(BaseOptions(baseUrl: AppUrls.baseUrl));

  NetworkApiService() {
    dio.interceptors.add(dioObserver);
    dio.options.headers = {'Content-Type': 'application/json'};
  }

  @override
  Future<NetworkResponse> getAPIResponse(String url,
      Map<String, dynamic>? headers, CancelToken? cancelToken) async {
    final networkResponse = ().init;

    try {
      Map<String, dynamic>? requestHeaders = headers;
      final response = await dio.get(
        url,
        cancelToken: cancelToken,
        options: Options(headers: requestHeaders),
      );
      final result = await responseStatus(response);
      if (result.$1 != null) {
        return networkResponse.setSuccess((response: result.$1!));
      } else {
        return networkResponse.setFail(result.$2!);
      }
    } on DioException catch (e) {
      return networkResponse.setFail(_handleDioError(e));
    } catch (e) {
      log('STR_UNEXPECTED_ERROR, $url');
      return networkResponse
          .setFail((message: "STR_UNEXPECTED_ERROR", type: "STR"));
    }
  }

  @override
  Future<NetworkResponse> putAPIResponse(String url, dynamic data,
      Map<String, dynamic>? headers, CancelToken? cancelToken) async {
    final networkResponse = ().init;
    try {
      final requestHeaders = headers;
      final response = await dio.put(
        url,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: requestHeaders),
      );
      final result = await responseStatus(response);
      if (result.$1 != null) {
        return networkResponse.setSuccess((response: result.$1!));
      } else {
        return networkResponse.setFail(result.$2!);
      }
    } on DioException catch (e) {
      return networkResponse.setFail(_handleDioError(e));
    } catch (e) {
      log('Error in putAPIResponse: ${e.toString()}');
      return networkResponse
          .setFail((message: "STR_UNEXPECTED_ERROR", type: "STR"));
    }
  }

  @override
  Future<NetworkResponse> postAPIResponse(String url, dynamic data,
      Map<String, dynamic>? headers, CancelToken? cancelToken) async {
    final networkResponse = ().init;
    try {
      final requestHeaders = headers;
      final response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: requestHeaders),
      );
      final result = await responseStatus(response);
      if (result.$1 != null) {
        return networkResponse.setSuccess((response: result.$1!));
      } else {
        return networkResponse.setFail(result.$2!);
      }
    } on DioException catch (e) {
      return networkResponse.setFail(_handleDioError(e));
    } catch (e) {
      log('STR_UNEXPECTED_ERROR, $url');
      return networkResponse
          .setFail((message: "STR_UNEXPECTED_ERROR", type: "STR"));
    }
  }

  @override
  Future<NetworkResponse> deleteAPIResponse(String url, dynamic data,
      Map<String, dynamic>? headers, CancelToken? cancelToken) async {
    final networkResponse = ().init;
    try {
      final requestHeaders = headers;
      final response = await dio.delete(
        url,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: requestHeaders),
      );
      final result = await responseStatus(response);
      if (result.$1 != null) {
        return networkResponse.setSuccess((response: result.$1!));
      } else {
        return networkResponse.setFail(result.$2!);
      }
    } on DioException catch (e) {
      return networkResponse.setFail(_handleDioError(e));
    } catch (e) {
      log('Error in delete APIResponse: ${e.toString()}');
      return networkResponse
          .setFail((message: "STR_UNEXPECTED_ERROR", type: "STR"));
    }
  }

  Future<(Response? res, ResponseFail? fail)> responseStatus(
      Response response) async {
    switch (response.statusCode) {
      case 401:
        return (null, (type: 'sessionEXP', message: "session expired"));
      case 500:
        return (null, (type: '500', message: "SERVER NOT RESPONDING"));
      case 404:
        return (null, (type: '404', message: "404 Not Found"));
      default:
        return (response, null);
    }
  }

  ResponseFail _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return (message: "CONNECTION_TIMEOUT", type: "TIMEOUT");
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          return (message: "404 Not Found", type: "404");
        } else {
          return (message: "STR_SERVER_NOT_RESPONDING", type: "STR");
        }
      case DioExceptionType.cancel:
        return (message: "REQUEST_CANCELLED", type: "CANCELLED");

      case DioExceptionType.connectionError:
        return (message: "INTERNET_ISSUE", type: "INTERNET_ISSUE");

      case DioExceptionType.unknown:
      default:
        return (message: "STR_UNEXPECTED_ERROR", type: "STR");
    }
  }
}
