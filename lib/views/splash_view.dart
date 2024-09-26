import 'package:flutter/material.dart';
import 'package:health_pal/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SplashViewBody(),
    );
  }
}
