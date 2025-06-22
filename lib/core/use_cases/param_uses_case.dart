import 'package:book/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UsesCase<T, param> {
  Future<Either<Failures, T>> call(param param);
}
