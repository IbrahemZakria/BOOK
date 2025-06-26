import 'package:flutter/material.dart';

class SliverAppBarr extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SliverAppBarr({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
