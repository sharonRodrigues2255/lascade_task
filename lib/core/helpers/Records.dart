import 'package:dio/dio.dart';

typedef ResponseSuccess = ({Response<dynamic> response});
typedef ResponseFail = ({String type, String message});
typedef NetworkResponse = ({ResponseSuccess? success, ResponseFail? fail});

extension InitNetworkExtensions on () {
  NetworkResponse get init => (fail: null, success: null);
}

extension NetworkExtensions on NetworkResponse {
  NetworkResponse setSuccess(ResponseSuccess value) {
    return (success: value, fail: this.fail);
  }

  NetworkResponse setFail(ResponseFail value) {
    return (success: this.success, fail: value);
  }
}
