import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lounchtimeadd/bindings/lounchtimeadd_binding.dart';
import '../modules/lounchtimeadd/views/lounchtimeadd_view.dart';
import '../modules/showlounchtime/bindings/showlounchtime_binding.dart';
import '../modules/showlounchtime/views/showlounchtime_view.dart';
import '../modules/timelist/bindings/timelist_binding.dart';
import '../modules/timelist/views/timelist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TIMELIST,
      page: () => const TimelistView(),
      binding: TimelistBinding(),
    ),
    GetPage(
      name: _Paths.LOUNCHTIMEADD,
      page: () => const LounchtimeaddView(),
      binding: LounchtimeaddBinding(),
    ),
    GetPage(
      name: _Paths.SHOWLOUNCHTIME,
      page: () => const ShowlounchtimeView(),
      binding: ShowlounchtimeBinding(),
    ),
  ];
}
