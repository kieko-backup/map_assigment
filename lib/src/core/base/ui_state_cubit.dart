import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_assignment/src/core/core.dart';
part 'ui_state.dart';
part 'ui_state_cubit.freezed.dart';

typedef LoadDataCallback<T> = FutureOr<UiState<T>> Function();
typedef LoadDataResponseCallback<R> = FutureOr<DataResponse<R>> Function();
typedef OnDataResponseSuccessCallback<T, R> = FutureOr<T?> Function(R);

class UiStateCubit<T> extends Cubit<UiState<T>> {
  UiStateCubit({UiState<T>? initialState})
      : super(initialState ?? const UiState.initial());

  Future<void> handleLoadData(LoadDataCallback<T> loadData) async {
    emit(UiState.loading(state.data));
    final newState = await loadData();
    emit(newState);
  }

  Future<void> loadData<R>({
    T? oldData,
    required LoadDataResponseCallback<R> onLoad,
    OnDataResponseSuccessCallback<T, R>? onSuccess,
  }) async {
    emit(UiState.loading(oldData ?? state.data));
    final res = await onLoad();
    final newState = await res.when<FutureOr<UiState<T>>>(
      success: (data) async => UiState.success(
        data: await onSuccess?.call(data),
      ),
      failed: (message, err) => UiState.failed(
        message,
        error: err,
        oldData: oldData ?? state.data,
      ),
    );
    emit(newState);
  }
}

extension UiStateX<T> on UiState<T> {
  handleStateWithEasyLoading(
    BuildContext context, {
    Function(T?)? onInitial,
    Function(T?)? onLoading,
    Function(T?)? onSuccess,
    Function(T?)? onFailed,
    bool showSuccessMessage = true,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      when(
        initial: (data) {
          EasyLoading.dismiss();
          onInitial?.call(data);
        },
        loading: (data) {
          EasyLoading.show(
            maskType: EasyLoadingMaskType.clear,
          );
          onLoading?.call(data);
        },
        success: (data, message) {
          EasyLoading.dismiss();
          if (showSuccessMessage) {
            message?.showInfoSnackBar(context);
          }
          onSuccess?.call(data);
        },
        failed: (message, err, data) {
          EasyLoading.dismiss();
          final errorMessage =
              err != null ? context.l10nErrorMessage(err) : message;
          context.showErrorDialog(errorMessage, onClosePressed: () {
            onFailed?.call(data);
          });
        },
      );
    });
  }
}
