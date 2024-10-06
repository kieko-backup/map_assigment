import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

part 'map_display_cubit.freezed.dart';
part 'map_display_state.dart';

@injectable
class MapDisplayCubit extends Cubit<MapDisplayState> {
  MapDisplayCubit() : super(const MapDisplayState());

  Future<void> load() async {
    emit(state.copyWith(
        selectedLocation: const LatLng(16.871, 96.199))); // Center of Myanmar;
  }

  Future<void> updateLocation(LatLng location) async {
    emit(state.copyWith(selectedLocation: location));
  }
}
