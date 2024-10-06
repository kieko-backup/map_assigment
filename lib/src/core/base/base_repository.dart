import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:map_assignment/src/core/core.dart';

export 'data_response.dart';

typedef GetDataCallback<T> = FutureOr<T> Function();
typedef ProcessDataCallback<T, R> = FutureOr<R> Function(T);

mixin BaseRepository {
  Future<DataResponse<Result>> getData<Data, Result>({
    required GetDataCallback<Data> handleDataRequest,
    required ProcessDataCallback<Data, Result> handleDataResponse,
  }) async {
    try {
      final Data data = await handleDataRequest();
      final Result result = await handleDataResponse(data);
      return SuccessDataResponse(result);
    } on DioException catch (error) {
      final result = error.parseError;
      AppLogger.e(error.message ?? 'Dio Error', error.stackTrace);
      return result.fold((l) => FailedDataResponse(l),
              (r) => FailedDataResponse('', error: AppError(r)));
    } on AppError catch (error) {
      AppLogger.e(error.toString());
      return FailedDataResponse(error.toString(), error: error);
    } catch (error) {
      AppLogger.e(error.toString());
      return FailedDataResponse(error.toString());
    }
  }
}
extension DioErrorX on DioException {
  Either<String, AppErrorType> get parseError {
    AppErrorType errorType;
    String? message;
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        errorType = AppErrorType.connectTimeout;
        break;
      case DioExceptionType.badResponse:
        errorType = _handleError(response?.statusCode);
        message = _parseErrorMessage(response?.data);
        break;
      case DioExceptionType.connectionError:
        if (error is SocketException) {
          /// No network connection error
          errorType = AppErrorType.noConnection;
        }
        errorType = AppErrorType.defaultServerError;
        break;
      default:
        errorType = AppErrorType.defaultServerError;
        break;
    }
    if (message != null && message.isNotEmpty) {
      AppLogger.i("message: $message");
      return left(message);
    }
    return right(errorType);
  }

  AppErrorType _handleError(int? statusCode) {
    switch (statusCode) {
      case 401:
       // return AppErrorType.unauthorized;
      case 400:
      // return AppErrorType.badRequest;
      case 404:
      // return AppErrorType.notFound;
      case 403:
      // return AppErrorType.forbidden;
      case 500:
      case 502:
      // return AppErrorType.serverError;
      default:
        return AppErrorType.defaultServerError;
    }
  }

  String? _parseErrorMessage(dynamic error) {
    if (error is Map?) {
      final errorJson = error ?? {};
      if (errorJson.containsKey('message')) {
        final message = (errorJson['message'] as String?) ?? '';
        return message.isEmpty ? null : message;
      }
      if (errorJson.containsKey('messages')) {
        final message = (errorJson['messages'] as String?) ?? '';
        return message.isEmpty ? null : message;
      }
    }
    return error.toString();
  }
}
