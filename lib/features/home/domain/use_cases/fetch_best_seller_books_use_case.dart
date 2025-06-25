import 'package:book/core/error/failures.dart';
import 'package:book/core/use_cases/param_uses_case.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchBestSellerBooksUseCase extends UsesCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchBestSellerBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failures, List<BookEntity>>> call(int startIndex) {
    return homeRepo.fetchBestSellerBooks(pageNumper: startIndex);
  }
}
