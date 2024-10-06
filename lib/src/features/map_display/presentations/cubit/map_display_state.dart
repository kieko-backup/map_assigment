part of 'map_display_cubit.dart';

@freezed
class MapDisplayState with _$MapDisplayState {
  const MapDisplayState._();
  const factory MapDisplayState({
    @Default(LatLng(0.00,0.00)) LatLng selectedLocation,
  }) = _MapDisplayState;
}
