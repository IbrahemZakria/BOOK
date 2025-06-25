import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousesliderImageWidget extends StatelessWidget {
  const CarousesliderImageWidget({
    this.onPageChanged,
    super.key,
    this.spaceBetweenItem = .5,
    this.centerheadline = true,
    this.infintyScroll = false,
    required this.books,
  });
  final double spaceBetweenItem;
  final List<BookEntity> books;

  final bool centerheadline;
  final bool infintyScroll;
  final void Function(int index, CarouselPageChangedReason reason)?
  onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: onPageChanged,

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
            onTap: () {
              Navigator.pushNamed(
                context,
                BookDetailsView.routeName,
                arguments: books[index],
              );
            },
            image: books[index].image,
          );
        },
      ),
    );
  }
}
