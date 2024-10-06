part of 'ui_state_cubit.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const UiState._();

  const factory UiState.initial([T? initialData]) = _initial<T>;

  const factory UiState.loading([T? oldData]) = _loading<T>;

  const factory UiState.success({T? data, String? message}) = _success<T>;

  const factory UiState.failed(String message, {AppError? error, T? oldData}) =
      _failed<T>;

  T? get data => when(
        initial: (data) => data,
        loading: (data) => data,
        success: (data, _) => data,
        failed: (_, $, data) => data,
      );

  String get errorMessage => maybeWhen(
        orElse: () => '',
        failed: (message, $, _) => message,
      );

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);

  bool get isFailed => maybeMap(orElse: () => false, failed: (_) => true);

  String getLocalizationError(BuildContext context) {
    return maybeWhen(
      orElse: () => '',
      failed: (message, error, _) =>
          error != null ? "": message // context.l10nErrorMessage(error) : message,
    );
  }
}
