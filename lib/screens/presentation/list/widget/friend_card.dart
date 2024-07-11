import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/core/util/image_service.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';
import 'package:get/get.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;
  final ImageService image;

  const FriendCard({super.key, required this.friend, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.isRegistered<ListController>()) {
          Get.find<ListController>().remove(friend);
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              image.getImage(friend),
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
