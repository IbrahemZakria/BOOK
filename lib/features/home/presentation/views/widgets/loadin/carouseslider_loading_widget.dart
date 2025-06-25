import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousesliderLoadingWidget extends StatelessWidget {
  const CarousesliderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
          height: double.infinity,
          scrollDirection: Axis.horizontal,
          animateToClosest: false,
          enableInfiniteScroll: false,
          padEnds: false,
          pauseAutoPlayInFiniteScroll: false,
          pauseAutoPlayOnTouch: false,
          autoPlay: false,
          aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
          viewportFraction: 0.5, // Adjust the viewport fraction as needed
        ),
        itemCount: 3,

        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
                child: Container(color: Colors.grey.shade300),
              ),
            ),
          );
        },
      ),
    );
  }
}
