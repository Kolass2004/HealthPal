import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/views/on_boarding_view.dart';
import 'package:health_pal/views/splash_view.dart';

abstract class AppRouter {
  static const String onBoardingView = "/onBoarding";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnBoardingView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = 0.0;
              const end = 1.0;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );
              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
