import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/features/map_download/data/map_repository.dart';
import 'package:path_provider/path_provider.dart';

part 'map_download_cubit.freezed.dart';
part 'map_download_state.dart';

@injectable
class MapDownloadCubit extends UiStateCubit<bool> {
  final MapRepository _repo;

  MapDownloadCubit(this._repo);

  Future<void> loadMapStatus() async {
    final mapMode = await _repo.mapMode();
    emit(UiState.initial(mapMode));
  }

  Future<void> download() async {
    emit(const UiState.loading());
    final res = await _repo.downloadMapFile();
    final newState = res.when<UiState<bool>>(
      success: (data) {
        _saveLocalFile(data);
        _repo.updateMapMode(true);
        return const UiState.success(data: true);
      },
      failed: (message, error) => UiState.failed(message, error: error),
    );
    emit(newState);
  }

  Future<void> updateMapMode() async {
    await _repo.updateMapMode(true);
    emit(const UiState.success(data: true));
  }

  _saveLocalFile(List<int> data) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/myanmar.map';
    final file = File(filePath);
    await file.writeAsBytes(data);
  }
}
