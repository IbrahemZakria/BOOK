import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featuredBooksUseCase) : super(FeatureBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future fetchFeatureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBooksloading());
    } else {
      emit(PaginationFeatureBooksLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        emit(FeatureBookserror(failure.errorMessage));
      },
      (books) {
        emit(FeatureBookssuccess(books));
      },
    );
  }
}
