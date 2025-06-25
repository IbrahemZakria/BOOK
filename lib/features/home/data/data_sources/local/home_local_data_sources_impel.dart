import 'package:book/constant.dart';
import 'package:book/features/home/data/data_sources/local/home_local_data_sources.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HomeLocalDataSourcesImpel extends HomeLocalDataSources {
  @override
  List<BookEntity> fetchBestSellerBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kbestSellerBox);
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;
    int listLength = box.values.length;
    if (startIndex >= listLength || endIndex > listLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
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
