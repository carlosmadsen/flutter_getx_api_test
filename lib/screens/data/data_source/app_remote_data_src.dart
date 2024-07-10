import 'package:dio/dio.dart' as dio;
import 'package:flutter_scroll_api_test/screens/data/data_source/app_env.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:get/get.dart';

abstract class AppRemoteDataSrc {
  const AppRemoteDataSrc();

  Future<List<Friend>> findAll(int page);
}

class AppRemoteDataSrcImpl extends AppRemoteDataSrc {
  const AppRemoteDataSrcImpl(this._client);
  final dio.Dio _client;
  final limit = 10;

  @override
  Future<List<Friend>> findAll(int page) async {
    List<Friend> list = [];
    String apiBaseUrl = '';
    String endPointFriends = '';

    if (Get.isRegistered<AppEnv>()) {
      apiBaseUrl = await Get.find<AppEnv>().apiBaseUrl;
      endPointFriends = await Get.find<AppEnv>().endPointFriends;
    }

    dio.Response response = await _client.get(
      '$apiBaseUrl$endPointFriends',
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> listResponse = response.data;
      for (var item in listResponse) {
        list.add(Friend.fromMap(item));
      }
    }

    return list;
  }
}
