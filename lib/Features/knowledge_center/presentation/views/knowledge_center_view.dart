import 'package:flutter/material.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/knowledge_center_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class KnowledgeCenterView extends StatelessWidget {
  const KnowledgeCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: KnowledgeCenterViewBody(),
    );
  }
}
