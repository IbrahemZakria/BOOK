import 'package:book/core/error/failures.dart';
import 'package:book/core/error/server_error.dart';
import 'package:book/features/home/data/data_sources/local/home_local_data_sources_impel.dart';
import 'package:book/features/home/data/data_sources/remote/home_remote_data_sources_impel.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSourcesImpel homeRemoteDataSourcesImpel;
  final HomeLocalDataSourcesImpel homeLocalDataSourcesImpel;
  HomeRepoImpl({
    required this.homeRemoteDataSourcesImpel,
    required this.homeLocalDataSourcesImpel,
  });
  @override
  Future<Either<Failures, List<BookEntity>>> fetchBestSellerBooks({
    int pageNumper = 0,
  }) async {
    print('fetchBestSellerBooks called with pageNumper: $pageNumper');
    try {
      List<BookEntity> books;
      books = homeLocalDataSourcesImpel.fetchBestSellerBooks(
        pageNumber: pageNumper,
      );
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await homeRemoteDataSourcesImpel.fetchBestSellerBooks(
        pageNumper: pageNumper,
      );

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
      List<BookEntity> books;
      books = homeLocalDataSourcesImpel.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await homeRemoteDataSourcesImpel.fetchFeaturedBooks();

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
  Future<Either<Failures, List<BookEntity>>> fetchRelevenceBook({
    required String category,
  }) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSourcesImpel.fetchRelevenceBook();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await homeRemoteDataSourcesImpel.fetchRelevenceBook(
        category: category,
      );

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
