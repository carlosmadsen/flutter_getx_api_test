import 'package:dartz/dartz.dart';
import 'package:flutter_scroll_api_test/core/error/exceptions.dart';
import 'package:flutter_scroll_api_test/core/error/failure.dart';
import 'package:flutter_scroll_api_test/core/util/type_def.dart';
import 'package:flutter_scroll_api_test/screens/data/data_source/app_remote_data_src.dart';
import 'package:flutter_scroll_api_test/screens/domain/entity/friend.dart';
import 'package:flutter_scroll_api_test/screens/domain/repo/app_repo.dart';

class AppRepoImpl extends AppRepo {
  final AppRemoteDataSrc _dataSrc;

  AppRepoImpl(this._dataSrc);

  @override
  ResultFuture<List<Friend>> findAll(int page) async {
    try {
      List<Friend> result = await _dataSrc.findAll(page);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
