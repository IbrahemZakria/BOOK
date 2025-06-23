import 'package:book/core/helper/function/add_response_to_list.dart';
import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/data_sources/remote/home_remote_data_sources.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpel extends HomeRemoteDataSources {
  late final ApiServises _apiServises;
  @override
  Future<List<BookEntity>> fetchBestSellerBooks() async {
    var response = await _apiServises.getData(
      'volumes?Filtering=free-ebooks&q=bestseller',
    );
    List<BookEntity> books = [];
    addResponseToList(response, books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final response = await _apiServises.getData('volumes?q=programming');
    List<BookEntity> books = [];
    addResponseToList(response, books);
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
    return books;
  }
}
