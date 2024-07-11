import 'package:dio/dio.dart' as dio;
import 'package:flutter_scroll_api_test/core/error/exceptions.dart';
import 'package:flutter_scroll_api_test/core/util/app_env.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:get/get.dart';

abstract class AppRemoteDataSrc {
  const AppRemoteDataSrc();

  Future<List<Friend>> findAll(int page);
}

class AppRemoteDataSrcImpl extends AppRemoteDataSrc {
  AppRemoteDataSrcImpl(this._client);
  final dio.Dio _client;
  late String _pagetLimit;
  late String _apiBaseUrl;
  late String _endPointFriends;

  Future<void> _loadEnv() async {
    if (Get.isRegistered<AppEnv>()) {
      _apiBaseUrl = await Get.find<AppEnv>().apiBaseUrl;
      _endPointFriends = await Get.find<AppEnv>().endPointFriends;
      _pagetLimit = await Get.find<AppEnv>().pageLimit;
    } else {
      _apiBaseUrl = '';
      _endPointFriends = '';
      _pagetLimit = '';
    }
    if (_apiBaseUrl.isEmpty) {
      throw Exception("apiBaseUrl não definido no arquivo env.");
    }
    if (_endPointFriends.isEmpty) {
      throw Exception("endPointFriends não definido no arquivo env.");
    }
    if (_pagetLimit.isEmpty) {
      throw Exception("pagetLimit não definido no arquivo env.");
    }
  }

  @override
  Future<List<Friend>> findAll(int page) async {
    try {
      await _loadEnv();

      dio.Response response = await _client.get(
        '$_apiBaseUrl$_endPointFriends',
        queryParameters: {
          'page': page.toString(),
          'limit': _pagetLimit,
        },
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode.toString(),
        );
      }

      List<Friend> list = [];
      List<dynamic> listResponse = response.data;
      for (var item in listResponse) {
        list.add(Friend.fromMap(item));
      }
      return list;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: "505",
      );
    }
  }
}
