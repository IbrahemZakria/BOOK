import 'package:book/core/utils/service_locator.dart';
import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:book/features/home/presentation/views_model/relevence_book_cubit/relevence_book_cubit_cubit.dart';
import 'package:book/features/search/presentation/views/widgets/custome_search_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RelevenceBookCubitCubit(getIt<HomeRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            CustomeSearchViewAppbar(),
            BlocBuilder<RelevenceBookCubitCubit, RelevenceBookCubitState>(
              builder: (context, state) {
                if (state is RelevenceBookCubitfailure) {
                  return CustomErrorText(text: "sorry it wasn't availabble");
                } else if (state is RelevenceBookCubitloading) {
                  return CustomLoadingindicator();
                } else if (state is RelevenceBookCubitsucess) {
                  // jsdmlds
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListViewBookItem(bookEntity: state.books[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: state.books.length,
                    ),
                  );
                }
                return CustomErrorText(text: 'search');
              },
            ),
          ],
        ),
      ),
    );
  }
}
