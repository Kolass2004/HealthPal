import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/views/home_view.dart';
import 'package:health_pal/views/sign_in_view.dart';
import 'package:health_pal/views/sign_up_view.dart';
import 'package:health_pal/views/on_boarding_view.dart';
import 'package:health_pal/views/splash_view.dart';

abstract class AppRouter {
  static const String onBoardingView = "/onBoardingView";
  static const String signUpView = "/signUpView";
  static const String signInView = "/signInView";
  static const String homeView = "/homeView";

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
        path: signUpView,
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
      GoRoute(
        path: signInView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignInView(),
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
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
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
