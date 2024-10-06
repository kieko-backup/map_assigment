import 'package:latlong2/latlong.dart';

extension LatlngX on LatLng {

   String  getLocationString() {
    return  "${latitude.toStringAsFixed(6)},${longitude.toStringAsFixed(6)}";
    
  }
}
