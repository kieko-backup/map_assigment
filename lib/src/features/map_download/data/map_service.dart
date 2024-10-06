import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

//part 'map_service.g.dart';

@injectable
@RestApi()
abstract class MapService {
  @factoryMethod
  factory MapService(Dio dio) = _MapService;

  @GET('map/myanmar.map')
  Future<Response<List<int>>> downloadMapFileRaw();
}

class _MapService implements MapService {
  _MapService(this._dio);
  final Dio _dio;

  @override
  Future<Response<List<int>>> downloadMapFileRaw() async {
    final response = await _dio.get<List<int>>(
      '/map/myanmar.map',
      options: Options(
        responseType: ResponseType.bytes, // Ensure it's streamed
      ),
    );
    return response; // Return the raw response
  }
}
