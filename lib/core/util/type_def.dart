import 'package:dartz/dartz.dart';
import 'package:flutter_scroll_api_test/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
