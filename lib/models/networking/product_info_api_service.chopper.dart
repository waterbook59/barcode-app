// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProductApiService extends ProductApiService {
  _$ProductApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProductApiService;

  @override
  Future<Response<dynamic>> getProductInfo(
      {String clientId = ProductApiService.clientId,
      String janCode,
      int results = 1}) {
    final $url = '/itemSearch';
    final $params = <String, dynamic>{
      'appid': clientId,
      'jan_code': janCode,
      'results': results
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
