import 'dart:io';

import 'package:dio/dio.dart';

// الكلاس الأساسي (يفترض أنه موجود)
abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

// كلاس ServerError لمعالجة أخطاء Dio
class ServerError extends Failures {
  ServerError(super.errorMessage);

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(
          'Connection timed out. Please check your internet and try again.',
        );

      case DioExceptionType.sendTimeout:
        return ServerError(
          'Request sending timed out. Please try again later.',
        );

      case DioExceptionType.receiveTimeout:
        return ServerError(
          'Failed to receive response from server. Please try again.',
        );

      case DioExceptionType.badCertificate:
        return ServerError(
          'Invalid security certificate. Please contact support or check server settings.',
        );

      case DioExceptionType.badResponse:
        // تخصيص الرسالة بناءً على كود الاستجابة
        final statusCode = dioError.response?.statusCode;
        if (statusCode != null) {
          ServerError.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          );
        }
        return ServerError('Invalid server response.');

      case DioExceptionType.cancel:
        return ServerError('Request was cancelled. Please try again.');

      case DioExceptionType.connectionError:
        return ServerError(
          'Failed to connect to the server. Please check your internet.',
        );

      case DioExceptionType.unknown:
        // التحقق من أخطاء الشبكة
        if (dioError.error != null && dioError.error is SocketException) {
          return ServerError(
            'No internet connection. Please check your network.',
          );
        }
        return ServerError(
          'An unknown error occurred. Please try again later.',
        );
    }
  }
  factory ServerError.fromResponse(int? statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerError(response["error"]["message"]);
    } else if (statuscode == 404) {
      return ServerError('Resource not found (Error 404).');
    } else if (statuscode == 500) {
      return ServerError('Server error (Error 500). Please try again later.');
    } else {
      return ServerError(
        'Failed to connect to the server. Please check your internet.',
      );
    }
  }
}
