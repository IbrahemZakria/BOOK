import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarousesliderImageWidget extends StatefulWidget {
  const CarousesliderImageWidget({
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

  @override
  State<CarousesliderImageWidget> createState() =>
      _CarousesliderImageWidgetState();
}

class _CarousesliderImageWidgetState extends State<CarousesliderImageWidget> {
  int nextPage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            if (index >= widget.books.length * .8) {
              BlocProvider.of<BestSellerBooksCubit>(
                context,
              ).featchBestSellerBooks(pageNumper: nextPage);
            }
          },

          initialPage: 1,
          height: double.infinity,
          enlargeCenterPage: widget.centerheadline,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          animateToClosest: true,
          enableInfiniteScroll: widget.infintyScroll,
          padEnds: true,
          pauseAutoPlayInFiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          autoPlay: true,
          aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
          viewportFraction:
              widget.spaceBetweenItem, // Adjust the viewport fraction as needed
        ),
        itemCount: widget.books.length,

        itemBuilder: (context, index, realIndex) {
          return ItemeImage(
            onTap: () {
              Navigator.pushNamed(
                context,
                BookDetailsView.routeName,
                arguments: widget.books[index],
              );
            },
            image: widget.books[index].image,
          );
        },
      ),
    );
  }
}
