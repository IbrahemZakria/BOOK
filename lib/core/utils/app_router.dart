import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/home_views.dart';
import 'package:book/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:book/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final homeviews = "/homeviews";
  static final bookdetailsview = "/bookdetailsview";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: [
          GoRoute(
            path: "/homeviews",
            builder: (BuildContext context, GoRouterState state) {
              return const HomeViews();
            },
          ),
          GoRoute(
            path: "/bookdetailsview",
            builder: (BuildContext context, GoRouterState state) {
              return const BookDetailsView();
            },
          ),
        ],
      ),
    ],
  );
}
