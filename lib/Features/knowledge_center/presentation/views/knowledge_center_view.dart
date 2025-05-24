import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/knowledge_center_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class KnowledgeCenterView extends StatelessWidget {
  const KnowledgeCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as UserModel;
    return Scaffold(
      drawer: UserDrawer(user: extra),
      body: const KnowledgeCenterViewBody(),
    );
  }
}
