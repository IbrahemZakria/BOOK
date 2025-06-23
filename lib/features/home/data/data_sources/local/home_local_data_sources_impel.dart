import 'package:book/constant.dart';
import 'package:book/features/home/data/data_sources/local/home_local_data_sources.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HomeRemoteDataSourcesImpel extends HomeLocalDataSources {
  @override
  List<BookEntity> fetchBestSellerBooks() {
    var box = Hive.box<BookEntity>(kbestSellerBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchRelevenceBook() {
    var box = Hive.box<BookEntity>(kRelvanseBox);
    return box.values.toList();
  }
}
