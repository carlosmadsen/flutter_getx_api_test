import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

abstract class AppRepo {
  Future<List<Friend>> findAll(int page);
}
