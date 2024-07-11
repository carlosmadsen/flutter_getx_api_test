import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/domain/usecases/friend_find_all.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  final FriendFindAll _friendFindAll;
  final List<Friend> _friends = <Friend>[].obs;

  final RxInt _page = 1.obs;
  final RxBool _firstLoadRealized = false.obs;
  final RxBool _loadingMoreFriends = false.obs;
  final RxBool _showGoBackButton = false.obs;
  final RxBool _continueRequest = true.obs;

  final ScrollController scrollController = ScrollController();

  ListController({required friendFindAll}) : _friendFindAll = friendFindAll;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    findAll();
  }

  void _onScroll() {
    if (loadingMoreFriends) {
      return;
    }
    if (scrollController.position.atEdge) {
      bool isTop = scrollController.position.pixels == 0;
      if (isTop) {
        print('Início do scroll: não faz nada.');
      } else {
        print('Chegou ao fim do scroll.');
        nextPage();
      }
    }
  }

  findAll() async {
    if (!_continueRequest.value) {
      return;
    }

    if (_firstLoadRealized.value) {
      _loadingMoreFriends.value = true;
    }

    print('load list page: $_page ');

    List<Friend> friendsAtualPage = [];
    final result = await _friendFindAll(_page.value);
    result.fold(
      (left) {
        print(left.toString());
      },
      (right) {
        friendsAtualPage = right;
      },
    );

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

  void remove(Friend friend) {
    _friends.remove(friend);
  }

  List<Friend> get friends => _friends;
  bool get firstLoadRealized => _firstLoadRealized.value;
  bool get loadingMoreFriends => _loadingMoreFriends.value;
  bool get showGoBackButton => _showGoBackButton.value;
  bool get continueRequest => _continueRequest.value;

  set showGoBackButton(bool value) => _showGoBackButton.value = value;
}
