import 'package:book/core/widgts/animated_loading_widget.dart';
import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/user_message.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image_widget.dart';
import 'package:book/features/home/presentation/views/widgets/loadin/carouseslider_loading_widget.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarousesliderImageHomeBuilder extends StatefulWidget {
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
  State<CarousesliderImageHomeBuilder> createState() =>
      _CarousesliderImageHomeBuilderState();
}

class _CarousesliderImageHomeBuilderState
    extends State<CarousesliderImageHomeBuilder> {
  List<BookEntity> books = [];
  int nextPage = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerBooksCubit, BestSellerBooksState>(
      listener: (context, state) {
        if (state is BestSellerBooksSucess) {
          books.addAll(state.books);
        }
        if (state is PaginationBestSellerBooksfailure) {
          Usermessage.show(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is BestSellerBooksLoading) {
          return AnimatedLoadingWidget(widget: CarousesliderLoadingWidget());
        } else if (state is PaginationBestSellerBooksLoading ||
            state is BestSellerBooksSucess ||
            state is PaginationBestSellerBooksfailure) {
          return CarousesliderImageWidget(
            books: books,
            onPageChanged: (index, reason) {
              if (index >= books.length * .8) {
                BlocProvider.of<BestSellerBooksCubit>(
                  context,
                ).featchBestSellerBooks(pageNumper: nextPage++);
              }
            },
          );
        } else if (state is BestSellerBooksFailuer) {
          return CustomErrorText(text: state.errorMessage);
        } else {
          return Text('opps thers is an error');
        }
      },
    );
  }
}
