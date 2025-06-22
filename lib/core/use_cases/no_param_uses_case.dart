import 'package:book/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UsesCase<T> {
  Future<Either<Failures, T>> call();
}
