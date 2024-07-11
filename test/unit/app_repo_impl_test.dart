import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/app_remote_data_src_mock.dart';

void main() {
  test("findAll Repo", () async {
    const String name = "Denise Gutkowski";
    const String avatar =
        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg";
    const String user = "Cole60";
    const String id = "12344";

    AppRemoteDataSrcImpl dataSrcMock = AppRemoteDataSrcImplMock();
    AppRemoteDataSrcImplMock.whenFindaAll(dataSrcMock,
        [Friend(id: int.parse(id), name: name, avatar: avatar, user: user)]);

    AppRepoImpl repo = AppRepoImpl(dataSrcMock);

    final result = await repo.findAll(1);

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
