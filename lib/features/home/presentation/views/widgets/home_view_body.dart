import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/home_book_listview.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image_home_builder.dart';
import 'package:book/features/home/presentation/views/widgets/custom_home_abbpar.dart';
import 'package:book/features/home/presentation/views/widgets/sliver_app_bar.dart';
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
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  pinned: false, // عشان تختفي لما تسكرول لتحت
                  floating: false, // عشان تبقى ثابتة فوق
                  delegate: SliverAppBarr(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CarousesliderImageHomeBuilder(),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 32)),
                SliverToBoxAdapter(
                  child: Text("Best Seller", style: Styles.textStyle18),
                ),
              ];
            },
            body: CustomScrollView(
              slivers: [SliverToBoxAdapter(child: HomeBookListview())],
            ),
          ),
        ),
      ],
    );
  }
}
