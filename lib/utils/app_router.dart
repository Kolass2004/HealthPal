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
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}
