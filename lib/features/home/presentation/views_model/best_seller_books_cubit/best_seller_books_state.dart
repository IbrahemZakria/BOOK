part of 'best_seller_books_cubit.dart';

abstract class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

class BestSellerBooksInitial extends BestSellerBooksState {}

class BestSellerBooksLoading extends BestSellerBooksState {}

class BestSellerBooksSucess extends BestSellerBooksState {
  final List<BookEntity> books;
  const BestSellerBooksSucess(this.books);
}

class BestSellerBooksFailuer extends BestSellerBooksState {
  final String errorMessage;
  const BestSellerBooksFailuer(this.errorMessage);
}
