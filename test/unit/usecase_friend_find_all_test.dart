import 'package:dartz/dartz.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/domain/usecases/friend_find_all.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import '../helpers/app_repo_impl_mock.dart';

void main() {
  test("findAll Usecase", () async {
    const String name = "Denise Gutkowski";
    const String avatar =
        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg";
    const String user = "Cole60";
    const String id = "12344";

    AppRepoImpl appRepoMock = AppRepoImplMock();
    AppRepoImplMock.whenFindaAll(appRepoMock,
        [Friend(id: int.parse(id), name: name, avatar: avatar, user: user)]);

    FriendFindAll usecase = FriendFindAll(appRepoMock);

    final result = await usecase(1);

    List<Friend> listResult = [];
    result.fold(
      (left) {},
      (right) {
        listResult = right;
      },
    );

    expect(listResult.length, 1);
    expect(listResult.first.name, name);
    expect(listResult.first.avatar, avatar);
    expect(listResult.first.user, user);
    expect(listResult.first.id.toString(), id);
  });
}
