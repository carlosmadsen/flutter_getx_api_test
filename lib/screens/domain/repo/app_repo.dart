import 'package:flutter_scroll_api_test/core/util/type_def.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';

abstract class AppRepo {
  ResultFuture<List<Friend>> findAll(int page);
}
