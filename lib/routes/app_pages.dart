import 'package:flutter_search_jisulee/modules/home/binding_home.dart';
import 'package:flutter_search_jisulee/modules/home/page_home.dart';
import 'package:flutter_search_jisulee/modules/viewer/page_viewer.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
