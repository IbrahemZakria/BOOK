import 'package:book/bloco_bserver.dart';
import 'package:book/constant.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/home_views.dart';
import 'package:book/features/home/presentation/views_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:book/features/home/presentation/views_model/feature_books_cubit/feature_books_cubit.dart';
import 'package:book/features/search/presentation/views/search_view.dart';
import 'package:book/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  setupSeviseLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter()); // تسجيل الـ adapter
  await Hive.openBox<BookEntity>('books'); // فتح صندوق للكتب
  Bloc.observer = MyBlocObserver();
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
          create: (context) =>
              BestSellerBooksCubit(getIt<HomeRepoImpl>())
                ..featchBestSellerBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FeatureBooksCubit(getIt<HomeRepoImpl>())..featchFeatureBooks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          iconTheme: const IconThemeData(color: kwhitecolor, size: 30),
          scaffoldBackgroundColor: kprimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routes: {
          SplashView.routeName: (context) => SplashView(),
          HomeViews.routeName: (context) => HomeViews(),
          BookDetailsView.routeName: (context) => BookDetailsView(),
          SearchView.routeName: (context) => SearchView(),
        },
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
