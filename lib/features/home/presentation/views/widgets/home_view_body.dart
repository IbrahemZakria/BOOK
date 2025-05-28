import 'package:book/features/home/presentation/views/widgets/custom_abbpar.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomAbbpar(), ItemeImage()]);
  }
}
