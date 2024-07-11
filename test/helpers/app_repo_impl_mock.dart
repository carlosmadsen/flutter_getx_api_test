import 'package:dartz/dartz.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:mocktail/mocktail.dart';

class AppRepoImplMock extends Mock implements AppRepoImpl {
  static void whenFindaAll(AppRepoImpl appRepoMock, List<Friend> listFriends) {
    when(() => appRepoMock.findAll(any())).thenAnswer((_) async {
      return Right(listFriends);
    });
  }
}
