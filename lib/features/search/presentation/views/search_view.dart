import 'package:book/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String routeName = "SearchView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SearchViewBody()));
  }
}
