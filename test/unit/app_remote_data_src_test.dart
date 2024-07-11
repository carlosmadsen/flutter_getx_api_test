import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_scroll_api_test/core/util/app_env.dart';
import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../helpers/dio_mock.dart';

void main() {
  test("findAll DataSrc", () async {
    const String name = "Denise Gutkowski";
    const String avatar =
        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg";
    const String user = "Cole60";
    const String id = "12344";

    //injetando dependência do .env
    Get.put<AppEnv>(
      AppEnv(
        DotEnv(),
      ),
    );

    dio.Dio dioMock = DioMock();
    DioMock.whenFindaAll(
      dioMock,
      [
        {
          "name": name,
          "avatar": avatar,
          "user": user,
          "id": id,
        }
      ],
    );

    AppRemoteDataSrcImpl datraSrc = AppRemoteDataSrcImpl(
      dioMock,
    );

    List<Friend> listResult = await datraSrc.findAll(1);

    expect(listResult.length, 1);
    expect(listResult.first.name, name);
    expect(listResult.first.avatar, avatar);
    expect(listResult.first.user, user);
    expect(listResult.first.id.toString(), id);
  });
}
