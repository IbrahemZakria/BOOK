import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/home_views.dart';
import 'package:book/features/search/presentation/views/search_view.dart';
import 'package:book/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final homeviews = "/homeviews";
  static final bookdetailsview = "/bookdetailsview";
  static final searchView = "/searchview";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: [
          GoRoute(
            path: homeviews,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeViews();
            },
          ),
          GoRoute(
            path: bookdetailsview,
            builder: (BuildContext context, GoRouterState state) {
              return const BookDetailsView();
            },
          ),
          GoRoute(
            path: searchView,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchView();
            },
          ),
        ],
      ),
    ],
  );
}
