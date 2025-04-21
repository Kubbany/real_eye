import 'package:flutter/material.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/about_us_view_body.dart';
import 'package:real_eye/core/widgets/app_drawer.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: AboutUsViewBody(),
    );
  }
}
