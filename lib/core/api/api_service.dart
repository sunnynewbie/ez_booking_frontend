import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:get/get.dart' as getIns;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  String url;
  HttpClient client = HttpClient();
  late Dio dio;

  ApiService({
    required this.url,
  }) {
    client.connectionTimeout = 10.seconds;
    client.idleTimeout = 10.seconds;
    dio = Dio(BaseOptions(
      baseUrl: NetworkUrl.baseUrl,
      connectTimeout: 20.seconds,
      receiveTimeout: 20.seconds,
    ))
      ..interceptors.add(PrettyDioLogger(request: true));
  }

  Future<Response> get(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');
    url = url.replace(queryParameters: query?.cast<String, String>());
    try {
      headers ??= {};
      setHeader(headers);
      dio.options.headers = headers;
      final response = await dio.get(path, queryParameters: query, data: data);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Response> post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    try {
      var url = Uri.parse('${NetworkUrl.baseUrl}$path');
      // url = url.replace(queryParameters: query?.cast<String, String>());

      headers ??= {};
      setHeader(headers);
      print(url);
      print(jsonEncode(data));
      dio.options.contentType=Headers.jsonContentType;
      dio.options.headers = headers;
      final response = await dio.post(path, data: data);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Response> postForm(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      headers ??= {};
      setHeader(headers);
      dio.options.headers = headers;
      final response = await dio.post(path, data: data, queryParameters: query);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Response> put(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      headers ??= {};
      setHeader(headers);
      dio.options.headers = headers;
      final response = await dio.put(path, data: data);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');

    try {
      headers ??= {};
      setHeader(headers);
      dio.options.headers = headers;
      final response =
          await dio.delete(path, data: data, queryParameters: query);
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  setHeader(Map<String, String> header) {
    var token = PrefUtils().getToken();
    if (token != null) {
      header.addAll({'token': token});
    }
  }
}
