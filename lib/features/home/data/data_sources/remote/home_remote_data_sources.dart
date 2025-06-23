import 'package:book/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchBestSellerBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
}
