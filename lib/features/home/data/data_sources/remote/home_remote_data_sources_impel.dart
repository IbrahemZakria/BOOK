import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/data_sources/remote/home_remote_data_sources.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpel extends HomeRemoteDataSources {
  late final ApiServises _apiServises;
  @override
  Future<List<BookEntity>> fetchBestSellerBooks() async {
    var response = await _apiServises.getData(
      'volumes?Filtering=free-ebooks&q=bestseller',
    );
    List<BookEntity> books = [];
    addBooksListt(response, books);
    return books;
  }

  void addBooksListt(response, List<BookEntity> books) {
    for (var item in response['items']) {
      books.add(HomeBookModel.fromJson(item));
    }
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final response = await _apiServises.getData('volumes?q=programming');
    List<BookEntity> books = [];
    addBooksListt(response, books);
    return books;
  }
}
