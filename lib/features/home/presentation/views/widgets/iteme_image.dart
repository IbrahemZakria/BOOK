import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemeImage extends StatelessWidget {
  const ItemeImage({
    super.key,
    required this.image,
    this.aspectRatio = 2.7 / 4,
    this.onTap,
  });
  final String image;
  final double aspectRatio;
  // Default aspect ratio, can be adjusted
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: AspectRatio(
            aspectRatio: aspectRatio, // Adjust the aspect ratio as needed
            child: CachedNetworkImage(
              fit: BoxFit.fill,

              imageUrl: image,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
