import 'package:book/core/widgts/animated_loading_widget.dart';
import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/widgets/list_view_book_item.dart';
import 'package:book/features/home/presentation/views/widgets/loadin/list_item_loading.dart';
import 'package:book/features/home/presentation/views_model/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBookListview extends StatefulWidget {
  const HomeBookListview({super.key});

  @override
  State<HomeBookListview> createState() => _HomeBookListviewState();
}

class _HomeBookListviewState extends State<HomeBookListview> {
  ScrollController scrollController = ScrollController();
  int pageNumber = 1;
  List<BookEntity> books = [];
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        BlocProvider.of<FeatureBooksCubit>(
          context,
        ).fetchFeatureBooks(pageNumber: pageNumber++);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
        builder: (context, state) {
          if (state is FeatureBooksloading) {
            return AnimatedLoadingWidget(
              widget: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  return ListItemLoading();
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            );
          } else if (state is FeatureBookssuccess ||
              state is PaginationFeatureBooksLoading ||
              state is PaginationFeatureBooksfailure) {
            state is FeatureBookssuccess ? books.addAll(state.books) : null;
            print("state.books.length: ${books.length}");
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: books.length,
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                return ListViewBookItem(bookEntity: books[index]);
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
