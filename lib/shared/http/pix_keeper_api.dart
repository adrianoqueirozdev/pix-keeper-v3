import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PixKeeperApi {
  final String _baseUrl;

  PixKeeperApi(this._baseUrl);

  final _timeout = const Duration(seconds: 15);
  final _defaultMessage = 'Aguarde alguns instantes. Tente novamente mais tarde';

  Future<dynamic> get(String url, [Map<String, dynamic>? queryParameters]) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse("$_baseUrl$url").replace(queryParameters: queryParameters)).timeout(_timeout);
      responseJson = _returnResponse(response);
    } catch (e) {
      throw Exception([_defaultMessage]);
    }

    return responseJson;
  }

  Future<dynamic> post(String url, body) async {
    dynamic responseJson;
    final bodyEncode = body != null ? jsonEncode(body) : body;

    try {
      final response = await http.post(Uri.parse("$_baseUrl$url"), body: bodyEncode).timeout(_timeout);
      responseJson = _returnResponse(response);
    } catch (e) {
      throw Exception([_defaultMessage]);
    }

    return responseJson;
  }

  Future<dynamic> put(String url, [dynamic body]) async {
    dynamic responseJson;
    final bodyEncode = body != null ? jsonEncode(body) : body;

    try {
      final response = await http.put(Uri.parse("$_baseUrl$url"), body: bodyEncode).timeout(_timeout);
      responseJson = _returnResponse(response);
    } catch (e) {
      throw Exception([_defaultMessage]);
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    dynamic apiResponse;

    try {
      final response = await http.delete(Uri.parse("$_baseUrl$url")).timeout(_timeout);
      apiResponse = _returnResponse(response);
    } catch (e) {
      throw Exception([_defaultMessage]);
    }

    return apiResponse;
  }
}

_returnResponse(http.Response response) {
  late dynamic responseJson;

  switch (response.statusCode) {
    case 200:
      responseJson = jsonDecode(response.body);
      return responseJson;
    case 201:
      responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
    case 401:
    case 403:
    case 404:
    case 500:
      throw jsonDecode(response.body);
    default:
      throw throw jsonDecode(response.body);
  }
}
