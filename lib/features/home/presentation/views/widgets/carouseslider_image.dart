import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousesliderImage extends StatelessWidget {
  const CarousesliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 2,
          height: double.infinity,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          animateToClosest: true,
          enableInfiniteScroll: false,
          padEnds: true,
          pauseAutoPlayInFiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          autoPlay: true,
          aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
          viewportFraction: .5,
        ),
        itemCount: 5,

        itemBuilder: (context, index, realIndex) {
          return ItemeImage();
        },
      ),
    );
  }
}
