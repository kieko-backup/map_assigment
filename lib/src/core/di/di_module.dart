import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const Duration _connectTimeout = Duration(seconds: 60);
const Duration _sendTimeout = Duration(seconds: 60);
const Duration _receiveTimeout = Duration(seconds: 60);

@module
abstract class DiModule {
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: false,
        ),
      );

  Dio provideApiClient(FlutterSecureStorage secureStorage) {
    final options = BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: _connectTimeout,
        sendTimeout: _sendTimeout,
        receiveTimeout: _receiveTimeout,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.bytes);
    final dio = Dio(options);

    // Interceptor for debugging
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        maxWidth: 130,
      ));
    }
    return dio;
  }
}
