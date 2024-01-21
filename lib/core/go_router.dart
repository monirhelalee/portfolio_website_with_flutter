import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio_flutter/features/blog/view/blog_view.dart';
import 'package:my_portfolio_flutter/features/home/view/home_view.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'blog',
          builder: (BuildContext context, GoRouterState state) {
            return const BlogView();
          },
        ),
      ],
    ),
  ],
);
