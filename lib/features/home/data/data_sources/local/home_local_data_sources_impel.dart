import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/data_sources/local/home_local_data_sources.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpel extends HomeLocalDataSources {
  late final ApiServises _apiServises;

  @override
  List<BookEntity> fetchBestSellerBooks() {
    // TODO: implement fetchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchRelevenceBook({required String category}) {
    // TODO: implement fetchRelevenceBook
    throw UnimplementedError();
  }
}
