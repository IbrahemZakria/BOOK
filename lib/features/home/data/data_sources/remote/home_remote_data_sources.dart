import 'package:book/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchBestSellerBooks({int pageNumper = 0});
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchRelevenceBook({required String category});
}
