import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;
  //final ListController _controller;

  const FriendCard(
      {super.key,
      required this.friend /*, required ListController controller*/}) /*: _controller = controller*/;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //print("remover friend id: ${friend.id}");
        //_controller.remove(friend);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                friend.avatar,
                width: 70,
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(friend.user),
                    Text(friend.name),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
