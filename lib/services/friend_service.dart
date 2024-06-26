import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:dio/dio.dart';

class FriendService {
  final Dio dio = Dio();
  final limit = 10;

  Future<List<Friend>> findAll(int page) async {
    List<Friend> list = [];

    Response response = await dio.get(
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
