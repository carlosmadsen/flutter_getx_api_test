import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:mocktail/mocktail.dart';

class AppRemoteDataSrcImplMock extends Mock implements AppRemoteDataSrcImpl {
  static void whenFindaAll(
      AppRemoteDataSrcImpl dataSrcMock, List<Friend> listFriends) {
    when(() => dataSrcMock.findAll(any())).thenAnswer((_) async {
      return listFriends;
    });
  }
}
