import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image.dart';
import 'package:book/features/home/presentation/views/widgets/custom_home_abbpar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHomeAbbpar(),
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CarousesliderImage()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: Text("Best Seller", style: Styles.textStyle18),
              ),
              SliverToBoxAdapter(child: BestSellerListview()),
            ],
          ),
        ),
      ],
    );
  }
}
