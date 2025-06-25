import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetch_best_seller_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this._fetchBestSellerBooksUseCase)
    : super(BestSellerBooksInitial());
  final FetchBestSellerBooksUseCase _fetchBestSellerBooksUseCase;
  Future featchBestSellerBooks({int pageNumper = 0}) async {
    if (pageNumper > 0) {
      emit(PaginationBestSellerBooksLoading());
    } else {
      emit(BestSellerBooksLoading());
    }
    var resault = await _fetchBestSellerBooksUseCase.call(pageNumper);
    resault.fold(
      (failures) {
        if (pageNumper > 0) {
          emit(PaginationBestSellerBooksfailure("This is all the books"));
        }
        emit(BestSellerBooksFailuer(failures.errorMessage));
      },
      (books) {
        emit(BestSellerBooksSucess(books));
      },
    );
  }
}
