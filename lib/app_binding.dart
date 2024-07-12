import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_scroll_api_test/core/util/app_env.dart';
import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/repo/app_repo.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies({AppRepo? appRepo}) {
    if (appRepo != null) {
      Get.put<AppRepo>(appRepo);
    } else {
      Get.put<AppRepo>(
        AppRepoImpl(
          AppRemoteDataSrcImpl(
            Dio(),
          ),
        ),
      );
    }

    Get.put<AppEnv>(
      AppEnv(
        DotEnv(),
      ),
    );
  }
}
