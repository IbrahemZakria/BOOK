import 'package:flutter/material.dart';

class ItemeImage extends StatelessWidget {
  const ItemeImage({
    super.key,
    required this.image,
    this.aspectRatio = 2.7 / 4,
  });
  final String image;
  final double aspectRatio; // Default aspect ratio, can be adjusted

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AspectRatio(
        aspectRatio: aspectRatio, // Adjust the aspect ratio as needed
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image), // Replace with your image path
              fit: BoxFit.fill, // Adjust the fit as needed
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
