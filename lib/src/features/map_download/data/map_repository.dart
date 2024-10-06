import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/features/map_download/data/map_service.dart';

@injectable
class MapRepository with BaseRepository {
  final FlutterSecureStorage _storage;
  final MapService _service;
  MapRepository(this._storage, this._service);

  Future<bool> mapMode() async {
    final indexString = await _storage.read(key: 'is_map_downloaded');
    final isAlreadyDownload = bool.tryParse(indexString ?? '') ?? false;
    return isAlreadyDownload;
  }

  Future<DataResponse<List<int>>> downloadMapFile() async {
    return getData<Response<List<int>>, List<int>>(handleDataRequest: () {
      return _service.downloadMapFileRaw();
    }, handleDataResponse: (res) {
      return res.data!;
    });
  }

  Future<void> updateMapMode(bool mode) async {
    await _storage.write(key: 'is_map_downloaded', value: mode.toString());
  }
}
