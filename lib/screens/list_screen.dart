import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/components/friend_card.dart';
import 'package:flutter_scroll_api_test/components/loading.dart';
import 'package:flutter_scroll_api_test/components/message.dart';
import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/list_screen_controller.dart';
import 'package:flutter_scroll_api_test/services/friend_service.dart';
import 'package:get/get.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final ListScreenController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _controller = ListScreenController(
      service: FriendService(),
    );
    _controller.findAll();
  }

  void _onScroll() {
    if (_controller.loadingMoreFriends) {
      return;
    }
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        print('Início do scroll: não faz nada.');
      } else {
        print('Chegou ao fim do scroll.');
        _controller.nextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _controller.friends.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _controller.friends.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Friend friend = _controller.friends[index];
                          return FriendCard(friend: friend);
                        }),
                  ),
                  _controller.loadingMoreFriends
                      ? const Loading(big: false)
                      : Container(
                          height: 0,
                        ),
                  _controller.showGoBackButton
                      ? ElevatedButton(
                          onPressed: () {
                            _scrollController.animateTo(
                              0.0, // posição para rolar
                              duration: const Duration(
                                  seconds: 1), // duração da animação
                              curve: Curves.easeInOut, // curva da animação
                            );
                            _controller.showGoBackButton = false;
                          },
                          child: const Text('Voltar'),
                        )
                      : Container(
                          height: 0,
                        )
                ],
              ),
            )
          : _controller.firstLoadRealized
              ? const Message(message: 'Nenhum amigo encontrado.')
              : const Loading(big: true);
    });
  }
}
