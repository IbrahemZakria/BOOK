class BookEntity {
  final String image;
  final String title;
  final String autherName;
  final String price;
  final String category;
  final num rating;

  BookEntity({
    required this.category,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
  });
}
