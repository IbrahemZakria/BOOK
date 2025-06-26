import 'package:book/core/error/failures.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchBestSellerBooks({
    int pageNumper = 0,
  });
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumper = 0,
  });
  Future<Either<Failures, List<BookEntity>>> fetchRelevenceBook({
    required String category,
  });
}
