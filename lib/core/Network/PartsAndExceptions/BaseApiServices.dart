import 'package:dio/dio.dart';

import '../../helpers/Records.dart';

abstract class BaseApiServices {
  Future<NetworkResponse> getAPIResponse(
      String url, Map<String, dynamic> headers, CancelToken? cancelToken);
  Future<NetworkResponse> postAPIResponse(String url, dynamic data,
      Map<String, dynamic> headers, CancelToken? cancelToken);
  Future<NetworkResponse> putAPIResponse(String url, dynamic data,
      Map<String, dynamic> headers, CancelToken? cancelToken);
  Future<NetworkResponse> deleteAPIResponse(String url, dynamic data,
      Map<String, dynamic> headers, CancelToken? cancelToken);
}
