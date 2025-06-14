import 'package:book/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, SearchView.routeName);
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
