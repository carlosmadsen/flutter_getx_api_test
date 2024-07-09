import 'package:flutter_scroll_api_test/core/routes/app_routes.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/list_binding.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/list_page.dart';
import 'package:get/get.dart';

class AppPages {
  const AppPages();

  static final pages = [
    GetPage(
      name: AppRoutes.list,
      binding: ListBinding(),
      page: () => const ListPage(),
    )
  ];
}
