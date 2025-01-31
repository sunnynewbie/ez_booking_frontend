import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ez_booking/core/api/api_response.dart';
import 'package:ez_booking/core/api/api_service.dart';
import 'package:ez_booking/core/api/network_url.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/booking_request_model.dart';
import 'package:ez_booking/model/city_model.dart';
import 'package:ez_booking/model/create_single_booking_model.dart';
import 'package:ez_booking/model/dashboard_cateogry_model.dart';
import 'package:ez_booking/model/dashboard_model.dart';
import 'package:ez_booking/model/event_and_reviews_model.dart';
import 'package:ez_booking/model/event_model.dart';
import 'package:ez_booking/model/event_price_model.dart';
import 'package:ez_booking/model/event_time_slot_model.dart';
import 'package:ez_booking/model/my_booking_model.dart';
import 'package:ez_booking/model/notification_model.dart';
import 'package:ez_booking/model/order_model.dart';
import 'package:ez_booking/model/organizer_model.dart';
import 'package:ez_booking/model/params/add_user_booking_param.dart';
import 'package:ez_booking/model/params/booking_request_param.dart';
import 'package:ez_booking/model/params/cancel_booking_request_param.dart';
import 'package:ez_booking/model/params/event_price_param.dart';
import 'package:ez_booking/model/params/event_review_param.dart';
import 'package:ez_booking/model/params/update_user_param.dart';
import 'package:ez_booking/model/params/updated_bookng_param.dart';
import 'package:ez_booking/model/privacy_content_model.dart';
import 'package:ez_booking/model/privacy_model.dart';
import 'package:ez_booking/model/review_model.dart';
import 'package:ez_booking/model/search_result_model.dart';
import 'package:ez_booking/model/user_model.dart';

class ApiRepository {
  static final ApiRepository _instance = ApiRepository._();

  ApiRepository._();

  factory ApiRepository() => _instance;

  ApiService apiService = ApiService(url: NetworkUrl.baseUrl);

  Future<ApiResponse> sendEvent(Map<String, dynamic> data) async {
    try {
      var response = await apiService.post(path: 'path', data: data);
      return ApiResponse.fromResponse(response);
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<SearchResultModel?>> searchApi(
      {Map<String, dynamic>? query}) async {
    try {
      var response = await apiService.get(
        path: NetworkUrl.searchAPI,
        query: query,
      );
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? SearchResultModel.fromJson(p0) : null,
      );
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel?>> sendOTP(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.sendOtp, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel?>> createGuestLogin(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.createGuestLogin, data: data);
      if (response.headers['token'] != null) {
        await PrefUtils().setToken(response.headers.value('token').toString());
      }

      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<CityModel>>> getCities(
      {Map<String, dynamic>? query}) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getCities, query: query);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map['data'] is List
            ? (map['data'] as List).map((e) => CityModel.fromJson(e)).toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel?>> setCity(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.setCity, data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel>> verifyOtp(Map<String, dynamic>? data) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.verifyFirebseLogin, data: data);
      if (response.headers['token'] != null) {
        await PrefUtils().setToken(response.headers.value('token').toString());
      }
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<UserModel>> getUser({Map<String, dynamic>? query}) async {
    try {
      var response = await apiService.get(
          path: NetworkUrl.getUser(Appservice.instance.user.value!.id),
          query: query);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map != null ? UserModel.fromJson(map) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<PopularEventsBean>>> getMostBooked(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getMostBooked, query: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (map) => map['data'] is List
            ? (map['data'] as List)
                .map((e) => PopularEventsBean.fromJson(e))
                .toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<OrganizerModel?>> getOrganizerById(
      {required num id}) async {
    try {
      var response = await apiService.get(path: NetworkUrl.organizer(id));
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? OrganizerModel.fromJson(p0) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<EventAndReviewModel?>> eventAndReviewsByOrganizer(
      {required num organizerId}) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.eventAndReviews(organizerId));
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? EventAndReviewModel.fromJson(p0) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<AllCategoryBean>>> getCategoriesbyType(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getCategories, query: data);
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<AllCategoryBean>>> exploreCategories(
      Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.exploreCategories, query: data);
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<EventTimeSlotModel>>> getTimeSlots(int id) async {
    try {
      var response = await apiService.get(path: NetworkUrl.getTimeSlots(id));
      return ApiResponse.fromResponse(response, fromJson: (p0) {
        var slots = p0['time_slots'];
        if (slots is String) {
          return (jsonDecode(slots) as List)
              .map((e) => EventTimeSlotModel.fromJson(e))
              .toList();
        }
        return (slots is List)
            ? (slots).map((e) => EventTimeSlotModel.fromJson(e)).toList()
            : [];
      });
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse> createBooking(Map<String, dynamic>? data) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.createBooking, data: data);
      return ApiResponse.fromResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse> createBookingRequest(Map<String, dynamic>? data) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.createBookingReuest, data: data);
      return ApiResponse.fromResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<EventPriceModel?>> getPrice(EventPriceParam param) async {
    try {
      var response =
          await apiService.post(path: NetworkUrl.getPrice, data: param.toMap());
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? EventPriceModel.fromJson(p0) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<CreateSingleBookingModel>> createOneTmeBooking(
      AddUserBookingParam param) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.createOnTimeBooking, data: param.toJson());
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) {
          return CreateSingleBookingModel.fromJson(p0);
        },
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse> addUserToBooking(Map<String, dynamic>? data) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.updateUserInBooking, data: data);
      return ApiResponse.fromResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<BookingRequestModel>>> getBookingsRequest(
      BookingRequestparam param) async {
    try {
      var response = await apiService.get(
          path: NetworkUrl.getBookingRequest, query: param.toMap());
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List)
                .map((e) => BookingRequestModel.fromJson(e))
                .toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<MyBookingModel>>> upcomingBookings(
      {Map<String, dynamic>? query}) async {
    try {
      var response = await apiService.get(
        path: NetworkUrl.upcomingBookings,
        query: query,
      );
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List)
                .map((e) => MyBookingModel.fromJson(e))
                .toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<BookingRequestModel?>> getSingleBooking(
      {required int id, Map<String, dynamic>? data}) async {
    try {
      var response = await apiService.get(
          path: NetworkUrl.getSingleBookingRequest(id), data: data);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? BookingRequestModel.fromJson(p0) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<ReviewModel?>> addReview({required FormData param}) async {
    try {
      var response = await apiService.postFormData(
        path: NetworkUrl.addReview,
        formData: param,
      );
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0 != null ? ReviewModel.fromJson(p0) : null,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  // Future<ApiResponse<ReviewModel?>> addReview(
  //     {required AddReviewParam param}) async {
  //   try {
  //     var response = await apiService.post(
  //       path: NetworkUrl.addReview,
  //       data: param.toMap(),
  //     );
  //     return ApiResponse.fromResponse(
  //       response,
  //       fromJson: (p0) => p0 != null ? ReviewModel.fromJson(p0) : null,
  //     );
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       return ApiResponse.fromResponse(e.response!);
  //     }
  //     return ApiResponse();
  //   } on Exception catch (e) {
  //     return ApiResponse();
  //   }
  // }

  Future<ApiResponse<List<ReviewModel>>> getReviews() async {
    try {
      var response = await apiService.get(
        path: NetworkUrl.userReviews,
      );
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List).map((e) => ReviewModel.fromJson(e)).toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<ReviewModel>>> getEventReviews(
      EventReviewParam param) async {
    try {
      var response = await apiService.get(
          path: NetworkUrl.getEventReviews, data: param.toMap());
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => (p0['data'] is List)
            ? (p0['data'] as List).map((e) => ReviewModel.fromJson(e)).toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<Category_typeBean>>> getHomeCategory() async {
    try {
      var response = await apiService.get(path: NetworkUrl.mainCategory);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0['data'] is List
            ? (p0['data'] as List).map((e) {
                return e is String
                    ? Category_typeBean.fromJson(jsonDecode(e))
                    : Category_typeBean.fromJson(e);
              }).toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
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
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<OrderModel>>> approveRejectBooking(
      UpdateBookingParam param) async {
    try {
      var response = await apiService.post(
          path: NetworkUrl.verifyPayment, data: param.toMap());

      return ApiResponse.fromResponse(response,
          fromJson: (p0) => p0['data'] is List
              ? (p0['data'] as List).map((e) => OrderModel.fromJson(e)).toList()
              : []);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<PrivacyModel>>> getPolicies() async {
    try {
      var response = await apiService.get(path: NetworkUrl.getPolicies);

      return ApiResponse.fromResponse(response,
          fromJson: (p0) => p0['data'] is List
              ? (p0['data'] as List)
                  .map((e) => PrivacyModel.fromJson(e))
                  .toList()
              : []);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<PrivacyContentModel?>> getPolicyContent(int id) async {
    try {
      var response =
          await apiService.get(path: NetworkUrl.getPoliciesContent(id));

      return ApiResponse.fromResponse(response,
          fromJson: (p0) =>
              p0 != null ? PrivacyContentModel.fromJson(p0) : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse<List<NotificationModel>>> getNotificationList() async {
    try {
      var response = await apiService.get(path: NetworkUrl.notificationList);
      return ApiResponse.fromResponse(
        response,
        fromJson: (p0) => p0['data'] is List
            ? (p0['data'] as List)
                .map((e) => NotificationModel.fromJson(e))
                .toList()
            : [],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }

  Future<ApiResponse> cancelBookingRequest(CancelBookingParam param) async {
    try {
      var response = await apiService.put(
          path: NetworkUrl.canceBookingrequest, data: param.toMap());

      return ApiResponse.fromResponse(response,
          fromJson: (p0) =>
              p0 != null ? PrivacyContentModel.fromJson(p0) : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse.fromResponse(e.response!);
      }
      return ApiResponse();
    } on Exception catch (e) {
      return ApiResponse();
    }
  }
}
