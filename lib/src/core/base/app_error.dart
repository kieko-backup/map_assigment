import 'package:flutter/material.dart';

enum AppErrorType {
  defaultServerError,
  defaultError,
  noConnection,
  connectTimeout,
}

class AppError<T> {
  final AppErrorType errorType;
  final T? data;

  AppError(this.errorType, {this.data});

  factory AppError.defaultServerError() =>
      AppError(AppErrorType.defaultServerError);

  factory AppError.defaultError() => AppError(AppErrorType.defaultError);

}

extension AppErrorX on AppError? {
  String errorMessage(BuildContext context, String message) {
    if (this == null) return message;
    return  "";//context.l10nErrorMessage(this!);
  }
}
