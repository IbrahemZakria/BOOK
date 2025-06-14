import 'package:book/core/error/failures.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<HomeBookModel>>> fetchBestSellerBooks();
  Future<Either<Failures, List<HomeBookModel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<HomeBookModel>>> fetchRelevenceBook({
    required String category,
  });
}
