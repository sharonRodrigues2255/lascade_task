import 'package:dio/dio.dart';

import '../../helpers/Records.dart';

abstract class BaseApiServices {
  Future<NetworkResponse> getAPIResponse(
      String url, Map<String, dynamic> headers, CancelToken? cancelToken);
}
