import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/contact_us_view_body.dart';
import 'package:real_eye/core/widgets/app_drawer.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: ContactUsViewBody(),
    );
  }
}
