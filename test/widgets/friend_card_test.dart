import 'package:flutter_scroll_api_test/core/util/image_service.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/widget/friend_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import '../helpers/image_service_mock.dart';

void main() {
  testWidgets("Friend Card", (tester) async {
    const String name = "Denise Gutkowski";
    const String user = "Cole60";
    const String avatarAsset = 'assets/imgs/avatar.jpg';
    final Friend friend = Friend(
      id: 123,
      name: name,
      avatar:
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg",
      user: user,
    );

    ImageService imageService = ImageServiceMock();
    ImageServiceMock.whenGetImage(imageService, friend, avatarAsset);

    when(() => imageService.getImage(friend))
        .thenAnswer((_) => Image.asset(avatarAsset, width: 70, height: 70));

    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
          body: FriendCard(
        friend: friend,
        image: imageService,
      )),
    ));
    //aguradando o todo o render da página
    await tester.pumpAndSettle();

    final findName = find.text(name);
    final findUser = find.text(user);
    expect(findName, findsOneWidget);
    expect(findUser, findsOneWidget);

    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as AssetImage).assetName, avatarAsset);
  });
}
