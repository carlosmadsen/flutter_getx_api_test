import 'package:flutter_scroll_api_test/core/usecases/usecases.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/domain/repo/app_repo.dart';

class FriendFindAll extends UsecaseWithParams<List<Friend>, int> {
  final AppRepo _repo;

  FriendFindAll(this._repo);

  @override
  Future<List<Friend>> call(int params) {
    return _repo.findAll(params);
  }
}
