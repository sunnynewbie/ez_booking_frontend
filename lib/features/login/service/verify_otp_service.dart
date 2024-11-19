import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:ez_booking/model/verify_otp.dart';

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
      // Extract token from the response header (e.g., "Authorization")
      String? token = response.headers['token']; // Replace with actual token header name

      // Log the headers to verify token extraction
      log("Headers: ${response.headers}");

      // Parse the response body and pass the token
      return ApiResponse.fromJson(jsonDecode(response.body), token);
    } else {
      throw Exception('Failed to verify OTP');
    }
  }
}
