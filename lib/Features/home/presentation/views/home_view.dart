import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/home_view_body.dart';
import 'package:real_eye/core/widgets/app_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: HomeViewBody(),
    );
  }
}
