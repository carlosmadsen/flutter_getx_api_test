import 'package:flutter_scroll_api_test/app_binding.dart';
import 'package:flutter_scroll_api_test/core/util/app_env.dart';
import 'package:flutter_scroll_api_test/screens/data/repo/app_repo_impl.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/list_binding.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/app_repo_impl_mock.dart';
import '../helpers/repo_friends_test.dart';

class InitialBindingsListPageTest extends Bindings {
  final List<Friend> friends;
  InitialBindingsListPageTest(this.friends);
  @override
  void dependencies() {
    AppRepoImpl appRepoMock = AppRepoImplMock();
    AppRepoImplMock.whenFindaAll(appRepoMock, friends);

    AppBinding().dependencies(appRepo: appRepoMock);
    ListBinding().dependencies();
  }
}

void main() {
  /*AppRepoImplMock.whenFindaAll(appRepoMock, [
    Friend(
      id: 1,
      name: 'Carlos',
      avatar:
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg",
      user: 'carlos',
    )
  ]);*/

  testWidgets("List Page no friends", (tester) async {
    await tester.pumpWidget(GetMaterialApp(
      initialBinding: InitialBindingsListPageTest([]),
      home: const Scaffold(body: ListPage()),
    ));

    //aguradando o todo o render da página
    await tester.pumpAndSettle();

    //verificando se texto que não há nenhum amigo foi apresentado
    final findNenhumAmigo = find.text("Nenhum amigo encontrado.");
    expect(findNenhumAmigo, findsOneWidget);
  });

  testWidgets("List Page with friends", (tester) async {
    List<Friend> friends = RepoFriendsTest.getFriends();

    await tester.pumpWidget(GetMaterialApp(
      initialBinding: InitialBindingsListPageTest(friends),
      home: const Scaffold(body: ListPage()),
    ));

    ListController controller = Get.find<ListController>();

    //aguradando o todo o render da página
    await tester.pumpAndSettle();

    expect(controller.friends.length, friends.length);
    expect(find.text(controller.friends.first.name), findsOneWidget);
    expect(find.text(controller.friends.first.user), findsOneWidget);

    //rolando a listview até o último elemento
    await tester.scrollUntilVisible(
      find.text(controller.friends.last.user),
      5000.0, // Quantidade de rolagem em pixels por rolagem
    );

    expect(find.text(controller.friends.last.name), findsOneWidget);
    expect(find.text(controller.friends.last.user), findsOneWidget);
  });
}
