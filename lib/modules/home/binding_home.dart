
import 'package:flutter_search_jisulee/modules/home/controller_home.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}