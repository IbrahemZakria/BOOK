part of 'feature_books_cubit.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBookssuccess extends FeatureBooksState {
  final List<BookEntity> books;
  const FeatureBookssuccess(this.books);
}

class FeatureBooksloading extends FeatureBooksState {}

class FeatureBookserror extends FeatureBooksState {
  final String errorMessage;
  const FeatureBookserror(this.errorMessage);
}
