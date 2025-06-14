import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/presentation/views/widgets/bookviewsbody.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});
  static String routeName = "BookDetailsView";

  @override
  Widget build(BuildContext context) {
    final HomeBookModel args =
        ModalRoute.of(context)!.settings.arguments as HomeBookModel;

    return Scaffold(
      body: SafeArea(child: Bookviewsbody(homeBookModel: args)),
    );
  }
}
