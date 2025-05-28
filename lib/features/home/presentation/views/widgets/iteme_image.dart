import 'package:book/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ItemeImage extends StatelessWidget {
  const ItemeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.7 / 4, // Adjust the aspect ratio as needed
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetsData.testImage,
              ), // Replace with your image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
