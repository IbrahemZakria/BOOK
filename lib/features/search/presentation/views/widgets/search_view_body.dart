import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:book/features/search/presentation/views/widgets/custome_search_view_appbar.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          CustomeSearchViewAppbar(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListViewBookItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
