import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String url;
  HttpClient client = HttpClient();

  ApiService({
    required this.url,
  }) {
    client.connectionTimeout = 10.seconds;
    client.idleTimeout = 10.seconds;
  }

  Future<http.Response> get(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var url = Uri.parse('${NetworkUrl.baseUrl}$path');
    url=url.replace(queryParameters: query?.cast<String,String>());
    try {
      log(url.toString());
      headers ??= {};
      setHeader(headers);
      final response = await http.get(url, headers: headers).timeout(
        30.seconds,
        onTimeout: () {
          return http.Response(jsonEncode({'message': 'Timeout'}), 500);
        },
      );
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
      headers ??= {};
      setHeader(headers);
      final response =
            await http.post(url,body: data, headers: headers).timeout(
        30.seconds,
        onTimeout: () {
          return http.Response(jsonEncode({'message': 'Timeout'}), 500);
        },
      );
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
      headers ??= {};
      setHeader(headers);
      final response =
          await http.post(url, body: data, headers: headers).timeout(
        30.seconds,
        onTimeout: () {
          return http.Response(jsonEncode({'message': 'Timeout'}), 500);
        },
      );
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
      headers ??= {};
      setHeader(headers);
      final response =
          await http.put(url, body: data, headers: headers).timeout(
        30.seconds,
        onTimeout: () {
          return http.Response(jsonEncode({'message': 'Timeout'}), 500);
        },
      );
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
      headers ??= {};
      setHeader(headers);
      final response =
          await http.delete(url, body: data, headers: headers).timeout(
        30.seconds,
        onTimeout: () {
          return http.Response(jsonEncode({'message': 'Timeout'}), 500);
        },
      );
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
