import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
  HomeRepo homeRepo;
  Future featchFeatureBooks() async {
    emit(FeatureBooksloading());
    var resault = await homeRepo.fetchFeaturedBooks();
    resault.fold(
      (failure) {
        emit(FeatureBookserror(failure.errorMessage));
      },
      (books) {
        emit(FeatureBookssuccess(books));
      },
    );
  }
}
