import 'package:book/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookAppbar extends StatelessWidget {
  const CustomBookAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        const Spacer(),

        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
