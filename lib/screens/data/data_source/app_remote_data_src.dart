import 'package:dio/dio.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

abstract class AppRemoteDataSrc {
  const AppRemoteDataSrc();

  Future<List<Friend>> findAll(int page);
}

class AppRemoteDataSrcImpl extends AppRemoteDataSrc {
  const AppRemoteDataSrcImpl(this._client);
  final Dio _client;
  final limit = 10;

  @override
  Future<List<Friend>> findAll(int page) async {
    List<Friend> list = [];

    Response response = await _client.get(
      'https://66720d10e083e62ee43de76e.mockapi.io/friends',
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
