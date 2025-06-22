import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'relevence_book_cubit_state.dart';

class RelevenceBookCubitCubit extends Cubit<RelevenceBookCubitState> {
  RelevenceBookCubitCubit(this.homeRepo) : super(RelevenceBookCubitInitial());
  HomeRepo homeRepo;
  Future fetchRelevenceBookDetails({required String category}) async {
    emit(RelevenceBookCubitloading());
    var result = await homeRepo.fetchRelevenceBook(category: category);
    result.fold(
      (failures) {
        emit(RelevenceBookCubitfailure(failures.errorMessage));
      },
      (books) {
        emit(RelevenceBookCubitsucess(books));
      },
    );
  }
}
