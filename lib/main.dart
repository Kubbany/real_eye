import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/app_router.dart';

void main() {
  runApp(const RealEye());
}

class RealEye extends StatelessWidget {
  const RealEye({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routerConfig: AppRouter.router,
    );
  }
}
