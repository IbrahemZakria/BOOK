import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAbbpar extends StatelessWidget {
  const CustomHomeAbbpar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo, height: 24, width: 75),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchView);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
