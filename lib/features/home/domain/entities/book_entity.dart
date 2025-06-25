import 'package:hive/hive.dart';

part 'book_entity.g.dart'; // هيتولد تلقائيًا

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String autherName;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final num rating;
  @HiveField(6)
  final bool isavailable;
  @HiveField(7)
  final String availableUrl;

  BookEntity({
    required this.category,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
    required this.isavailable,
    required this.availableUrl,
  });
}
