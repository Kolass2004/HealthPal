import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_router.dart';

void main() {
  runApp(const HealthPal());
}

class HealthPal extends StatelessWidget {
  const HealthPal({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    
    );
  }
}