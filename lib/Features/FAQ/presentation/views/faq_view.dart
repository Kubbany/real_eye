import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/faq_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const UserDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
      ),
      body: const FAQViewBody(),
    );
  }
}
