
import 'package:lascade_task/core/Exception/AppException.dart';

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message!, "NetworkApiService");
}
