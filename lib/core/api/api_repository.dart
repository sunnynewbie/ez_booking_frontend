import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/core/api/api_service.dart';
import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/user_model.dart';

class ApiRepository {
  static final ApiRepository _instance = ApiRepository._();

  ApiRepository._();

  factory ApiRepository() => _instance;

  ApiService apiService = ApiService(url: NetworkUrl.baseUrl);

  Future<ApiResponse<UserModel?>> sendOTP(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.sendOtp, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel>> verifyOtp(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.verifyOtp, data: data);
      if(response.headers['token']!=null){
        PrefUtils().setToken(response.headers['token'].toString());
      }
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel>> getUser(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getUser, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<List<EventModel>>> getEventList(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getEvents, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map['data'] is List
            ? (map['data'] as List)
                .map(
                  (e) => EventModel.fromJson(e),
                )
                .toList()
            : [],
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<EventModel?>> getEventBYId(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getEvent, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? EventModel.fromJson(p0) : null,
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> getCategoriesbyType(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.geCategories, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> getTimeSlots(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getTimeSlots, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> createBooking(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.createBooking, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> addUserToBooking(Map<String, dynamic>? data) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.updateUserInBooking, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> getBookings(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getBookings, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> getSingleBooking(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getBookingDetail, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse> addReview(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.sendOtp, data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }
}
