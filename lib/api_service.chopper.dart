// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future<Response<BuiltList<BuiltPost>>> getPosts() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<BuiltPost>, BuiltPost>($request);
  }

  Future<Response<BuiltPost>> getPost(dynamic id) {
    final $url = '/posts/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltPost, BuiltPost>($request);
  }
}
