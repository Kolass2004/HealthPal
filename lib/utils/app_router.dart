import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/views/sign_up_view.dart';
import 'package:health_pal/views/on_boarding_view.dart';
import 'package:health_pal/views/splash_view.dart';

abstract class AppRouter {
  static const String onBoardingView = "/onBoardingView";
  static const String loginView = "/loginView";

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
      GoRoute(
        path: loginView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignUpView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const beginOffset = Offset(1.0, 0.0); // Slide in from the right
              const endOffset = Offset(0.0, 0.0);
              const curve = Curves.easeInOut;

              var tween = Tween(begin: beginOffset, end: endOffset).chain(
                CurveTween(curve: curve),
              );
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
