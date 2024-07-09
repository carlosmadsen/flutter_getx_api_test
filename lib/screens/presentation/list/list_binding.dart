import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';
import 'package:flutter_scroll_api_test/services/friend_service.dart';
import 'package:get/get.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListController>(
      ListController(
        service: FriendService(),
      ),
    );
  }
}
