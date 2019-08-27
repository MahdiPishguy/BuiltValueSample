import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'built_value_convert.dart';
import 'posts/built_post.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') id);

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services: [
          _$ApiService(),
        ],
        converter: BuiltValueConvert(),
        interceptors: [
          //HeadersInterceptor({'Content-Type': 'application/json'}),
          HttpLoggingInterceptor(),
          (Response response) async {
            if (response.statusCode == 404) {
              chopperLogger.severe('404 NOT FOUND');
            }
          }
        ]);
    return _$ApiService(client);
  }
}
