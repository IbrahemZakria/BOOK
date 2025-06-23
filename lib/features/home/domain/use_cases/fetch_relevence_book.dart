import 'package:book/core/error/failures.dart';
import 'package:book/core/use_cases/param_uses_case.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchRelevenceBookUseCase extends UsesCase<List<BookEntity>, String> {
  late final HomeRepo _homeRepo;

  @override
  Future<Either<Failures, List<BookEntity>>> call(String category) {
    return _homeRepo.fetchRelevenceBook(category: category);
  }
}
