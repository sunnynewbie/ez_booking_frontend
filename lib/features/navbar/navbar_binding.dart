import 'package:ez_booking/controller/home_controller.dart';
import 'package:ez_booking/controller/navbar_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class NavBarBinding extends Bindings{
  @override
  void dependencies(){

    Get.lazyPut<NavBarController>(()=> NavBarController());
    Get.lazyPut<HomeController>(()=> HomeController());

  }
}