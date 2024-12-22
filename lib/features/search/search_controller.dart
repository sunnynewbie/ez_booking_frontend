import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/debouncer.dart';
import 'package:ez_booking/model/search_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchParam {
  String search;
  int page;
  int limit;
  int city_id;

  SearchParam({
    required this.search,
    required this.page,
    required this.limit,
    required this.city_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'search': this.search,
      'page': this.page,
      'limit': this.limit,
      'city_id': this.city_id,
    };
  }
}

class AppSearchController extends GetxController {
  var searchCtrl = TextEditingController();
  int page = 1;
  int limit = 10;
  RxList<SearchItem> categories = RxList.empty();
  RxList<SearchItem> events = RxList.empty();
  RxBool isLoading= RxBool(false);
  Debouncer debouncer = Debouncer(milliseconds: 300);

  Future<void> searchApi(String query) async {
    isLoading.value=true;
    var param = SearchParam(
      search: query,
      page: page,
      limit: limit,
      city_id: Appservice.instance.user.value!.city!.city_id.toInt(),
    );
    var response = await ApiRepository().searchApi(query: param.toMap());
    if (response.status) {
      categories.assignAll(response.data?.categories ?? []);
      events.assignAll(response.data?.events ?? []);
    }
    isLoading.value=false;
  }
}
