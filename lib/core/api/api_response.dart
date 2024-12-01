import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiResponse<T> {
  String? message;
  bool status;
  T? data;
  int? total;

  ApiResponse({
    this.message,
    this.status = false,
    this.data,
    this.total,
  });

  factory ApiResponse.fromResponse(Response response,
      {T? Function(dynamic)? fromJson}) {
    ApiResponse<T> apiResponse = ApiResponse();
    log('response status ${response.statusCode}');
    log('response body ${response.data}');
    var responseJson = response.data;
    if (response.statusCode == 200) {
      apiResponse.status = true;

      if (responseJson is Map) {
        apiResponse.message = responseJson['message'];
        if (responseJson.containsKey('total')) {
          apiResponse.total = responseJson['total'] as int;
        }
        if (responseJson.containsKey('data') && responseJson['data'] is Map) {
          if (fromJson != null) {
            apiResponse.data = fromJson.call(responseJson['data']);
          }
        } else {
          if (fromJson != null) {
            apiResponse.data = fromJson.call(responseJson);
          }
        }
      }
    } else {
      apiResponse.message = responseJson['message'].toString();
      if (fromJson != null) {
        apiResponse.data = responseJson['data'];
      } else {
        apiResponse.data = responseJson;
      }
    }

    return apiResponse;
  }
}

class AppException implements Exception {
  AppException(Exception e) {
    if (e is SocketException) {}
    if (e is FormatException) {}
    if (e is HttpException) {}
  }
}
