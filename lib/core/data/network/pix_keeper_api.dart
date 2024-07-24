import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PixKeeperApi {
  final String _baseUrl;
  final Duration _timeout;
  final String _defaultMessage;

  PixKeeperApi(this._baseUrl,
      {Duration timeout = const Duration(seconds: 15),
      String defaultMessage = 'Aguarde alguns instantes. Tente novamente mais tarde'})
      : _timeout = timeout,
        _defaultMessage = defaultMessage;

  Future<dynamic> get(String url, [Map<String, dynamic>? queryParameters]) async {
    try {
      final uri = Uri.parse("$_baseUrl$url").replace(queryParameters: queryParameters);
      final response = await http.get(uri).timeout(_timeout);
      return _handleResponse(response);
    } catch (e) {
      throw Exception(_defaultMessage);
    }
  }

  Future<dynamic> post(String url, dynamic body) async {
    try {
      final bodyEncode = body != null ? jsonEncode(body) : null;
      final response = await http.post(Uri.parse("$_baseUrl$url"), body: bodyEncode).timeout(_timeout);
      return _handleResponse(response);
    } catch (e) {
      throw Exception(_defaultMessage);
    }
  }

  Future<dynamic> put(String url, [dynamic body]) async {
    try {
      final bodyEncode = body != null ? jsonEncode(body) : null;
      final response = await http.put(Uri.parse("$_baseUrl$url"), body: bodyEncode).timeout(_timeout);
      return _handleResponse(response);
    } catch (e) {
      throw Exception(_defaultMessage);
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await http.delete(Uri.parse("$_baseUrl$url")).timeout(_timeout);
      return _handleResponse(response);
    } catch (e) {
      throw Exception(_defaultMessage);
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
      case 401:
      case 403:
      case 404:
      case 500:
        throw _handleError(response);
      default:
        throw _handleError(response);
    }
  }

  dynamic _handleError(http.Response response) {
    try {
      final errorJson = jsonDecode(response.body);
      return errorJson;
    } catch (e) {
      return {'message': _defaultMessage};
    }
  }
}
