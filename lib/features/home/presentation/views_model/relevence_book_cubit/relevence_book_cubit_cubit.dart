import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetch_relevence_book.dart';
import 'package:equatable/equatable.dart';

part 'relevence_book_cubit_state.dart';

class RelevenceBookCubitCubit extends Cubit<RelevenceBookCubitState> {
  RelevenceBookCubitCubit(this.fetchRelevenceBookUseCase)
    : super(RelevenceBookCubitInitial());
  final FetchRelevenceBookUseCase fetchRelevenceBookUseCase;
  Future fetchRelevenceBookDetails({required String category}) async {
    emit(RelevenceBookCubitloading());
    var result = await fetchRelevenceBookUseCase.call(category);
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
