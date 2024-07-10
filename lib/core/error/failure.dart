import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_api_test/core/error/exceptions.dart';

abstract class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is String || statusCode is int,
          "StatusCode cannot be a ${statusCode.runtimeType}",
        );

  final String message;
  final dynamic statusCode;

  String get errorMessages =>
      "$statusCode${statusCode is String ? "" : "Error"}: $message";

  @override
  List<dynamic> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromException(ApiException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
