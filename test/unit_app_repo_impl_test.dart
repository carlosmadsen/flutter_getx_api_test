import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_scroll_api_test/core/util/app_env.dart';
import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements dio.Dio {}

void main() {
  test("teste 1", () async {
    const String name = "Denise Gutkowski";
    const String avatar =
        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg";
    const String user = "Cole60";
    const String id = "12344";

    Get.put<AppEnv>(
      AppEnv(
        DotEnv(),
      ),
    );

    dio.Dio dioMock = DioMock();

    when(() => dioMock.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        )).thenAnswer(
      (_) async => dio.Response(
        data: [
          {
            "name": name,
            "avatar": avatar,
            "user": user,
            "id": id,
          }
        ],
        statusCode: 200,
        requestOptions: dio.RequestOptions(path: ''),
      ),
    );

    AppRepoImpl repo = AppRepoImpl(
      AppRemoteDataSrcImpl(
        dioMock,
      ),
    );

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
