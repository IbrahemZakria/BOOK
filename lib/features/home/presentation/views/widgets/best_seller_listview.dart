import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:flutter/material.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) => ListViewBookItem(),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
