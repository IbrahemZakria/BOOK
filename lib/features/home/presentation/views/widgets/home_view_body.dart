import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image.dart';
import 'package:book/features/home/presentation/views/widgets/custom_abbpar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAbbpar(),
          CarousesliderImage(),
          SizedBox(height: 50),
          Text("Best Seller", style: Styles.titleMedium),
        ],
      ),
    );
  }
}
