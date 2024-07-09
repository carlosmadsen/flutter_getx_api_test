import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_scroll_api_test/core/routes/app_pages.dart';
import 'package:flutter_scroll_api_test/core/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.list,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      getPages: AppPages.pages,
      //initialBinding: AppBinding(),
    );
  }
}
