import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.robotoTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
