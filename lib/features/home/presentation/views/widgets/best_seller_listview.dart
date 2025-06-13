import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loadingIndicator.dart';
import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:book/features/home/presentation/views_model/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Expanded(
            child: ListView.separated(
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                if (state is FeatureBooksloading) {
                  return CustomLoadingindicator();
                } else if (state is FeatureBookssuccess) {
                  return ListViewBookItem(homeBookModel: state.books[index]);
                } else if (state is FeatureBookserror) {
                  return CustomErrorText(text: state.errorMessage);
                } else {
                  return CustomErrorText(text: "opps there is an error");
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 10,
            ),
          ),
        );
      },
    );
  }
}
