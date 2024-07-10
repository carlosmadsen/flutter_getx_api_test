import 'package:flutter_scroll_api_test/screens/domain/usecases/friend_find_all.dart';
import 'package:flutter_scroll_api_test/screens/presentation/list/controller/list_controller.dart';
import 'package:get/get.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListController>(
      ListController(
        friendFindAll: FriendFindAll(Get.find()),
      ),
    );
  }
}
