import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/widgets/bookviewsbody.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});
  static String routeName = "BookDetailsView";

  @override
  Widget build(BuildContext context) {
    final BookEntity args =
        ModalRoute.of(context)!.settings.arguments as BookEntity;

    return Scaffold(
      body: SafeArea(child: Bookviewsbody(bookEntity: args)),
    );
  }
}
