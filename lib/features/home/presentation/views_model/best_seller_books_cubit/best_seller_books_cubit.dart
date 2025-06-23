import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
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
