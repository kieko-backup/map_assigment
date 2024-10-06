import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_assignment/src/core/core.dart';

part 'data_response.freezed.dart';

@freezed
class DataResponse<T> with _$DataResponse<T> {
  const DataResponse._();

  const factory DataResponse.success(T data) = SuccessDataResponse<T>;

  const factory DataResponse.failed(String message, {AppError? error}) =
      FailedDataResponse<T>;

  bool get hadFailed => when(success: (_) => false, failed: (_, $) => true);

  String get message =>
      when(success: (_) => '', failed: (message, $) => message);

  T? get data => when(success: (data) => data, failed: (_, $) => null);
}
