import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  HomeRepo homeRepo;
  Future featchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var resault = await homeRepo.fetchBestSellerBooks();
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
