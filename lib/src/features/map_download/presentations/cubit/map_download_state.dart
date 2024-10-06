part of 'map_download_cubit.dart';


@freezed
class MapDownloadState with _$MapDownloadState {
  const MapDownloadState._();

  const factory MapDownloadState.initial() = MapInitial;

  const factory MapDownloadState.lodaing() = MapLoading;

  const factory MapDownloadState.downloaded() = MapDownloaded;

  const factory MapDownloadState.failed() = MapFailed;

}
