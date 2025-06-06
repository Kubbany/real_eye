import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(errorMessage: "Server Connection Timeout.");
      case DioExceptionType.sendTimeout:
        return const ServerFailure(errorMessage: "Server Send Timeout.");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(errorMessage: "Server Receive Timeout.");
      case DioExceptionType.badCertificate:
        return const ServerFailure(errorMessage: "Server Bad Certificate.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure(errorMessage: "Request Canceled.");
      case DioExceptionType.connectionError:
        return const ServerFailure(errorMessage: "No Internet Connection.");
      case DioExceptionType.unknown:
        return const ServerFailure(errorMessage: "Unknown Error, Please Try Again Later.");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      String message = "Request not found";
      if (response['message'] != message) {
        message = response['message'];
      }
      return ServerFailure(errorMessage: message);
    } else if (statusCode >= 500) {
      return const ServerFailure(errorMessage: "Internal Server Error, Please Try Again.");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['message']);
    }
    return const ServerFailure(errorMessage: "Unknown Error, Please Try Again Later.");
  }
}

class GeneralFailure extends Failure {
  GeneralFailure({required super.errorMessage});
}

class ErrorHandler {
  static Failure handle(dynamic exception) {
    if (exception is DioException) {
      return ServerFailure.fromDioException(exception);
    } else if (exception is SocketException) {
      return const ServerFailure(errorMessage: "No Internet Connection.");
    } else if (exception is String) {
      return GeneralFailure(errorMessage: exception);
    } else {
      return GeneralFailure(errorMessage: " Unknown Error! Please Try Again.");
    }
  }
}

class FlaskFailure extends Failure {
  const FlaskFailure({required super.errorMessage});

  factory FlaskFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const FlaskFailure(errorMessage: "Server Connection Timeout.");
      case DioExceptionType.sendTimeout:
        return const FlaskFailure(errorMessage: "Server Send Timeout.");
      case DioExceptionType.receiveTimeout:
        return const FlaskFailure(errorMessage: "Server Receive Timeout.");
      case DioExceptionType.badCertificate:
        return const FlaskFailure(errorMessage: "Server Bad Certificate.");
      case DioExceptionType.badResponse:
        return FlaskFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const FlaskFailure(errorMessage: "Request Canceled.");
      case DioExceptionType.connectionError:
        return const FlaskFailure(errorMessage: "No Internet Connection.");
      case DioExceptionType.unknown:
        return const FlaskFailure(errorMessage: "Unknown Error, Please Try Again Later.");
    }
  }
  factory FlaskFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      String message = "Request not found";
      if (response['error'] != message) {
        message = response['error'];
      }
      return FlaskFailure(errorMessage: message);
    } else if (statusCode >= 500) {
      return const FlaskFailure(errorMessage: "Internal Server Error, Please Try Again.");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FlaskFailure(errorMessage: response['error']);
    }
    return const FlaskFailure(errorMessage: "Unknown Error, Please Try Again Later.");
  }
}

class FlaskHandler {
  static Failure handle(dynamic exception) {
    if (exception is DioException) {
      return FlaskFailure.fromDioException(exception);
    } else if (exception is SocketException) {
      return const FlaskFailure(errorMessage: "No Internet Connection.");
    } else if (exception is String) {
      return GeneralFailure(errorMessage: exception);
    } else {
      return GeneralFailure(errorMessage: " Unknown Error! Please Try Again.");
    }
  }
}
