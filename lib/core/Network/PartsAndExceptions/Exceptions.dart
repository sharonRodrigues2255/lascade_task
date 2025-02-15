
import 'package:lascade_task/core/exception/app_exception.dart';

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message!, "NetworkApiService");
}
