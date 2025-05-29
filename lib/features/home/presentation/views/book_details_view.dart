import 'package:book/features/home/presentation/views/widgets/bookviewsbody.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Bookviewsbody()));
  }
}
