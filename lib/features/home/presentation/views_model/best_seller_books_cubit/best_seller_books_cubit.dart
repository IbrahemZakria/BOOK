import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetch_best_seller_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.fetchBestSellerBooksUseCase)
    : super(BestSellerBooksInitial());
  final FetchBestSellerBooksUseCase fetchBestSellerBooksUseCase;
  Future featchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var resault = await fetchBestSellerBooksUseCase.call();
    resault.fold(
      (failures) {
        emit(BestSellerBooksFailuer(failures.errorMessage));
      },
      (books) {
        emit(BestSellerBooksSucess(books));
      },
    );
  }
}
