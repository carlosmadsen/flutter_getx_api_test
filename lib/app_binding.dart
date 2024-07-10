import 'package:dio/dio.dart';
import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/repo/app_repo.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppRepo>(
      AppRepoImpl(
        AppRemoteDataSrcImpl(
          Dio(),
        ),
      ),
    );
  }
}
