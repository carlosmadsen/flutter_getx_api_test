import 'package:flutter_scroll_api_test/screens/list_screen_controller.dart';
import 'package:flutter_scroll_api_test/services/friend_service.dart';
import 'package:get/get.dart';

setUpListScreen() {
  Get.put<ListScreenController>(
    ListScreenController(
      service: FriendService(),
    ),
  );
}
