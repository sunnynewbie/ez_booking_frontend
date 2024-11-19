import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

// Model for API response
class ApiResponse {
  final String? message;
  final bool status;
  final UserData? data;
  final String? token;  // Added token field

  ApiResponse({this.message, required this.status, this.data, this.token});

  factory ApiResponse.fromJson(Map<String, dynamic> json, String? token) {
    return ApiResponse(
      message: json['message'],
      status: json['status'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      token: token,  // Assign token here
    );
  }
}

class UserData {
  final int id;
  final String? name;
  final String phoneNo;
  final String? createdAt;
  final String? updatedAt;
  final int gender;

  UserData({
    required this.id,
    this.name,
    required this.phoneNo,
    this.createdAt,
    this.updatedAt,
    required this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      phoneNo: json['phone_no'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gender: json['gender'],
    );
  }
}

