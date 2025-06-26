import 'package:book/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSources {
  List<BookEntity> fetchBestSellerBooks({int pageNumber = 0});
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchRelevenceBook();
}
