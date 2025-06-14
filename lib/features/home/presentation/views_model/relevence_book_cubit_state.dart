part of 'relevence_book_cubit_cubit.dart';

abstract class RelevenceBookCubitState extends Equatable {
  const RelevenceBookCubitState();

  @override
  List<Object> get props => [];
}

class RelevenceBookCubitInitial extends RelevenceBookCubitState {}

class RelevenceBookCubitloading extends RelevenceBookCubitState {}

class RelevenceBookCubitsucess extends RelevenceBookCubitState {
  final List<HomeBookModel> books;
  const RelevenceBookCubitsucess(this.books);
}

class RelevenceBookCubitfailure extends RelevenceBookCubitState {
  final String erroMessage;
  const RelevenceBookCubitfailure(this.erroMessage);
}
