import 'dart:convert';

import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/core/api/api_service.dart';
import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/booking_detail_model.dart';
import 'package:ez_booking/model/booking_model.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:ez_booking/model/params/add_user_booking_param.dart';
import 'package:ez_booking/model/params/update_user_param.dart';
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
      if (response.headers['token'] != null) {
        await PrefUtils().setToken(response.headers.value('token').toString());
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

  Future<ApiResponse<UserModel>> getUser({Map<String, dynamic>? query}) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getUser, query: query);
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
          await apiService.get(path: NetworkUrl.getEvents, query: data);
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
      {required int id, Map<String, dynamic>? data}) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getEvent(id), query: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? EventModel.fromJson(p0) : null,
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<List<AllCategoryBean>>> getCategoriesbyType(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.geCategories, query: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List)
                .map(
                  (e) => AllCategoryBean.fromJson(e),
                )
                .toList()
            : [],
      );
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

  Future<ApiResponse<List<BookingModel>>> createOneTmeBooking(
      AddUserBookingParam param) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.createOnTimeBooking, data: param.toJson());
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) {
          return p0['data'] is List
              ? (p0['data'] as List)
                  .map((e) => BookingModel.fromJson(e))
                  .toList()
              : [];
        },
      );
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

  Future<ApiResponse<List<MyBookingModel>>> getBookings(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getBookings, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List)
                .map((e) => MyBookingModel.fromJson(e))
                .toList()
            : [],
      );
    } on Exception catch (e) {
      print(e);

      return ApiResponse();
    }
  }

  Future<ApiResponse<BookingDetailModel?>> getSingleBooking(
      {required int id, Map<String, dynamic>? data}) async {
    try {
      var response = await apiService.get(
          path: NetworkUrl.getBookingDetail(id), data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? BookingDetailModel.fromJson(p0) : null,
      );
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

  Future<ApiResponse<List<Category_typeBean>>> getHomeCategory() async {
    try {
      var response = await apiService.get(path: NetworkUrl.mainCategory);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0['data'] is List
            ? (p0['data'] as List)
                .map(
                  (e) => e is String
                      ? Category_typeBean.fromJson(jsonDecode(e))
                      : Category_typeBean.fromJson(e),
                )
                .toList()
            : [],
      );
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<DashboardModel?>> getDashboardContent() async {
    try {
      var response = await apiService.get(path: NetworkUrl.getDashboard);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? DashboardModel.fromJson(p0) : null,
      );
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel?>> editProfile(
      {required UpdateUserParam param}) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.updateUser, data: param.toMap());
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } catch (e) {
      print("Error updating user: $e");
      return ApiResponse();
    }
  }
}
