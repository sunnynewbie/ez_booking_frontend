import 'dart:convert';
import 'package:http/http.dart' as http;

// Model for API response
class ApiResponse {
  final String? message;
  final bool status;
  final UserData? data;

  ApiResponse({this.message, required this.status, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'],
      status: json['status'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
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

// Service class to handle API calls
class ApiService {
  Future<ApiResponse> verifyOtp(String otp, String phoneNo) async {
    const String url = 'https://ezbooking-node.onrender.com/v1/user/verify-otp'; // Replace with actual base URL
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'otp': otp,
        'phone_no': phoneNo,
      }),
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to verify OTP');
    }
  }
}
