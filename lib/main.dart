import 'package:book/constant.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:book/features/home/presentation/views_model/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BestSellerBooksCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => FeatureBooksCubit(getIt<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          iconTheme: const IconThemeData(color: kwhitecolor, size: 30),
          scaffoldBackgroundColor: kprimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
