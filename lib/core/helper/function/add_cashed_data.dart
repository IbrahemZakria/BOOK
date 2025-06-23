import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

void addCashedData({required List<BookEntity> books, required String boxName}) {
  Hive.box<BookEntity>(boxName).addAll(books);
}
