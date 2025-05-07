import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/faq_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: FAQViewBody(),
    );
  }
}
