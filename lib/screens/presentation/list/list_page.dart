import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/widget/friend_card.dart';
import 'package:flutter_scroll_api_test/core/commons/widgets/loading.dart';
import 'package:flutter_scroll_api_test/core/commons/widgets/message.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';
import 'package:get/get.dart';

class ListPage extends GetView<ListController> {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(title: const Text("Amigos")),
          body: controller.friends.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.friends.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Friend friend = controller.friends[index];
                              return FriendCard(
                                friend: friend,
                              );
                            }),
                      ),
                      ...controller.loadingMoreFriends
                          ? [const Loading(big: false)]
                          : [],
                      ...controller.showGoBackButton
                          ? [
                              ElevatedButton(
                                onPressed: () {
                                  controller.scrollController.animateTo(
                                    0.0, // posição para rolar
                                    duration: const Duration(
                                        seconds: 1), // duração da animação
                                    curve:
                                        Curves.easeInOut, // curva da animação
                                  );
                                  controller.showGoBackButton = false;
                                },
                                child: const Text('Voltar'),
                              )
                            ]
                          : []
                    ],
                  ),
                )
              : controller.firstLoadRealized
                  ? const Message(message: 'Nenhum amigo encontrado.')
                  : const Loading(big: true));
    });
  }
}
