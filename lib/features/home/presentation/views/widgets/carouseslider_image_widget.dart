import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousesliderImageWidget extends StatelessWidget {
  const CarousesliderImageWidget({
    super.key,
    this.spaceBetweenItem = .5,
    this.centerheadline = true,
    this.infintyScroll = false,
    required this.books,
  });
  final double spaceBetweenItem;
  final List<HomeBookModel> books;

  final bool centerheadline;
  final bool infintyScroll;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
          height: double.infinity,
          enlargeCenterPage: centerheadline,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          animateToClosest: true,
          enableInfiniteScroll: infintyScroll,
          padEnds: true,
          pauseAutoPlayInFiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          autoPlay: true,
          aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
          viewportFraction:
              spaceBetweenItem, // Adjust the viewport fraction as needed
        ),
        itemCount: books.length,

        itemBuilder: (context, index, realIndex) {
          return ItemeImage(
            image:
                books[index].volumeInfo?.imageLinks?.thumbnail ??
                "http://books.google.com/books/content?id=DBOXDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
          );
        },
      ),
    );
  }
}
