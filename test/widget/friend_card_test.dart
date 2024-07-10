import 'package:flutter_scroll_api_test/app_binding.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/widget/friend_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  testWidgets("Friend Card", (tester) async {
    //tem de fazer um mokito por causa do  Image.network

    //AppBinding().dependencies();
    const String name = "Denise Gutkowski";
    const String user = "Cole60";
    final Friend friend = Friend(
      id: 123,
      name: name,
      avatar:
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/735.jpg",
      user: user,
    );
    await tester.pumpWidget(GetMaterialApp(
      //initialBinding: AppBinding(),
      home: Scaffold(body: FriendCard(friend: friend)),
    ));
    final findName = find.text(name);
    final findUser = find.text(user);

    expect(findName, findsOneWidget);
    expect(findUser, findsOneWidget);
  });
}
