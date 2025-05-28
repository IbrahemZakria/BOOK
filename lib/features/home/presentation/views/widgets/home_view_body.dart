import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image.dart';
import 'package:book/features/home/presentation/views/widgets/custom_abbpar.dart';
import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
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
          SizedBox(height: 32),
          Text("Best Seller", style: Styles.titleMedium),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemBuilder: (context, index) => ListViewBookItem(),
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
