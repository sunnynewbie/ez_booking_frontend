import 'package:ez_booking/core/api/api_repository.dart';
import 'package:ez_booking/core/routes/route_config.dart';
import 'package:ez_booking/core/service/app_service.dart';
import 'package:ez_booking/core/utils/debouncer.dart';
import 'package:ez_booking/core/utils/pref_util.dart';
import 'package:ez_booking/model/city_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SelectCityParam {
  bool fromHome;
  String? cityName;

  SelectCityParam({
    this.fromHome = false,
    this.cityName,
  });
}

class SelectCityController extends GetxController {
  var cityName = '';
  var cityCtrl = TextEditingController();
  List<CityModel> cities = RxList.empty();
  Debouncer debouncer = Debouncer(milliseconds: 300);
  Rxn<CityModel> selectedCity = Rxn();
  RxBool isLoading = RxBool(false);
  late SelectCityParam param;

  @override
  void onInit() {
    param = Get.arguments as SelectCityParam;
    cityName = param.cityName ?? '';
    cityCtrl.text = cityName;
    super.onInit();
    // if (arg != null) {
    Future.delayed(Duration.zero, () async {
      isLoading.value = true;
      var response = await ApiRepository().getCities();
      if (response.status) {
        cities.assignAll(response.data ?? []);
        var item = cities.firstWhereOrNull((element) =>
            element.city_name.toLowerCase() == param.cityName?.toLowerCase());
        if (item != null) {
          selectedCity.value = item;
        }
      }
      isLoading.value = false;
    });
    // }
  }

  Future<void> selectCity() async {
    isLoading.value = true;
    var response =
        await ApiRepository().setCity({'city_id': selectedCity.value?.city_id});
    if (response.status) {
      var user = response.data;
      if (user != null) {
        Appservice.instance.user.value = user;
        await PrefUtils().setUser(user);
        if (param.fromHome) {
          Get.back(result: selectedCity.value);
        } else {
          Get.offNamedUntil(AppRoutes.bottomNavBar, (route) => false);
        }
      }
    }
    isLoading.value = false;
  }

  RxList<CityModel> get popularCities => RxList(cities.isEmpty
      ? []
      : cities.where((element) => element.is_top ?? false).toList());
}
