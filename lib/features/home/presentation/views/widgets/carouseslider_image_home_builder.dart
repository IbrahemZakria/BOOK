import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image_widget.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarousesliderImageHomeBuilder extends StatelessWidget {
  const CarousesliderImageHomeBuilder({
    super.key,
    this.spaceBetweenItem = .5,
    this.centerheadline = true,
    this.infintyScroll = false,
  });
  final double spaceBetweenItem;

  final bool centerheadline;
  final bool infintyScroll;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksLoading) {
          return CustomLoadingindicator();
        } else if (state is BestSellerBooksSucess) {
          return CarousesliderImageWidget(books: state.books);
        } else if (state is BestSellerBooksFailuer) {
          return CustomErrorText(text: state.errorMessage);
        } else {
          return Text('opps thers is an error');
        }
      },
    );
  }
}
