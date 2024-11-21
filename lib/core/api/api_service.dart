import 'package:ez_booking/core/api/network_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String url;
  ApiService({
    required this.url,
  });

  Future<http.Response> get(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
  Future<http.Response> post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      final response = await http.post(url, body: data, headers: headers);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
  Future<http.Response> postForm(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      final response = await http.post(url, body: data, headers: headers);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<http.Response> put(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      final response = await http.put(url, body: data, headers: headers);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<http.Response> delete(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      final response = await http.delete(url, body: data, headers: headers);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
}
