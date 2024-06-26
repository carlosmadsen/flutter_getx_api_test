import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:flutter_scroll_api_test/services/friend_service.dart';
import 'package:get/get.dart';

class ListScreenController extends GetxController {
  final FriendService service;
  final List<Friend> _friends = <Friend>[].obs;

  final RxInt _page = 1.obs;
  final RxBool _firstLoadRealized = false.obs;
  final RxBool _loadingMoreFriends = false.obs;
  final RxBool _showGoBackButton = false.obs;
  final RxBool _continueRequest = true.obs;

  ListScreenController({required this.service});

  findAll() async {
    if (!_continueRequest.value) {
      return;
    }

    if (_firstLoadRealized.value) {
      _loadingMoreFriends.value = true;
    }

    print('load list page: $_page ');

    List<Friend> friendsAtualPage = await service.findAll(_page.value);
    if (friendsAtualPage.isEmpty) {
      _continueRequest.value = false;
      _showGoBackButton.value = true;
    } else {
      _friends.addAll(friendsAtualPage);
    }

    if (_page.value == 1) {
      _firstLoadRealized.value = true;
    } else {
      _loadingMoreFriends.value = false;
    }
  }

  void nextPage() {
    if (_continueRequest.value) {
      _page.value++;
      findAll();
    }
  }

  List<Friend> get friends => _friends;
  bool get firstLoadRealized => _firstLoadRealized.value;
  bool get loadingMoreFriends => _loadingMoreFriends.value;
  bool get showGoBackButton => _showGoBackButton.value;
  bool get continueRequest => _continueRequest.value;

  set showGoBackButton(bool value) => _showGoBackButton.value = value;
}
