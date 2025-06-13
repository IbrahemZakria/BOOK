import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loadingIndicator.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarousesliderImage extends StatelessWidget {
  const CarousesliderImage({
    super.key,
    this.spaceBetweenItem = .5,
    this.centerheadline = true,
    this.infintyScroll = false,
  });
  final double spaceBetweenItem;

  final bool centerheadline;
  final bool infintyScroll;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksLoading) {
          return CustomLoadingindicator();
        } else if (state is BestSellerBooksSucess) {
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
              itemCount: state.books.length,

              itemBuilder: (context, index, realIndex) {
                return ItemeImage(
                  image:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                      "http://books.google.com/books/content?id=DBOXDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                );
              },
            ),
          );
        } else if (state is BestSellerBooksFailuer) {
          return CustomErrorText(text: state.errorMessage);
        } else {
          return Text('opps thers is an error');
        }
      },
    );
  }
}
