import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';

void addResponseToList(response, List<BookEntity> books) {
  for (var item in response['items']) {
    books.add(HomeBookModel.fromJson(item));
  }
}
