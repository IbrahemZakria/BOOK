import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:book/features/home/presentation/views_model/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
        builder: (context, state) {
          if (state is FeatureBooksloading) {
            return CustomLoadingindicator();
          } else if (state is FeatureBookssuccess) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                return ListViewBookItem(homeBookModel: state.books[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            );
          } else if (state is FeatureBookserror) {
            return CustomErrorText(text: state.errorMessage);
          } else {
            return CustomErrorText(text: "opps there is an error");
          }
        },
      ),
    );
  }
}
