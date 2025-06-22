import 'package:book/core/error/failures.dart';
import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServises apiServises;
  HomeRepoImpl({required this.apiServises});
  @override
  Future<Either<Failures, List<HomeBookModel>>> fetchBestSellerBooks() async {
    try {
      // Fetching best seller books from the API
      var response = await apiServises.getData(
        'volumes?Filtering=free-ebooks&q=bestseller',
      );
      List<HomeBookModel> books = [];
      for (var item in response['items']) {
        books.add(HomeBookModel.fromJson(item));
      }
      return Right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerError.fromDioError(error));
      } else {
        return Left(ServerError(error.toString()));
      }
    }
  }

  @override
  fetchFeaturedBooks() async {
    try {
      // Fetching best seller books from the API
      final response = await apiServises.getData('volumes?q=programming');
      List<HomeBookModel> books = [];
      for (var item in response['items']) {
        books.add(HomeBookModel.fromJson(item));
      }
      return Right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerError.fromDioError(error));
      } else {
        return Left(ServerError(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<HomeBookModel>>> fetchRelevenceBook({
    required String category,
  }) async {
    try {
      // Fetching best seller books from the API
      var response = await apiServises.getData(
        'volumes?q=$category&Filtering=free-ebooks&sorting=relevance',
      );
      List<HomeBookModel> books = [];
      for (var item in response['items']) {
        books.add(HomeBookModel.fromJson(item));
      }
      return Right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerError.fromDioError(error));
      } else {
        return Left(ServerError(error.toString()));
      }
    }
  }
}
