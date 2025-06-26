import 'package:book/constant.dart';
import 'package:book/core/helper/function/add_cashed_data.dart';
import 'package:book/core/helper/function/add_response_to_list.dart';
import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/data_sources/remote/home_remote_data_sources.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpel extends HomeRemoteDataSources {
  final ApiServises _apiServises;

  HomeRemoteDataSourcesImpel(this._apiServises);
  @override
  Future<List<BookEntity>> fetchBestSellerBooks({int pageNumper = 0}) async {
    var response = await _apiServises.getData(
      'volumes?Filtering=free-ebooks&q=bestseller&startIndex=${pageNumper * 10}',
    );

    List<BookEntity> books = [];
    addResponseToList(response, books);
    addCashedData(books: books, boxName: kbestSellerBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumper = 0}) async {
    final response = await _apiServises.getData(
      'volumes?q=programming${pageNumper * 10}',
    );
    List<BookEntity> books = [];
    addResponseToList(response, books);
    addCashedData(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelevenceBook({
    required String category,
  }) async {
    final response = await _apiServises.getData(
      'volumes?q=$category&Filtering=free-ebooks&sorting=relevance',
    );
    List<BookEntity> books = [];
    addResponseToList(response, books);
    addCashedData(books: books, boxName: kRelvanseBox);

    return books;
  }
}
