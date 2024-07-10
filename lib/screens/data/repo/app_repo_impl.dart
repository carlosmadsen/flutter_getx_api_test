import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/domain/repo/app_repo.dart';

class AppRepoImpl extends AppRepo {
  final AppRemoteDataSrc _dataSrc;

  AppRepoImpl(this._dataSrc);

  @override
  Future<List<Friend>> findAll(int page) async {
    List<Friend> result = await _dataSrc.findAll(page);
    return result;
  }
}
