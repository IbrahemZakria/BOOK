import 'package:book/core/error/failures.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchBestSellerBooksUseCase {
  final HomeRepo homeRepo;

  FetchBestSellerBooksUseCase(this.homeRepo);
  Future<Either<Failures, List<BookEntity>>> fetchBestSellerBooks() {
    return homeRepo.fetchBestSellerBooks();
  }
}
