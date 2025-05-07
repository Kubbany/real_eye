import 'package:flutter/material.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/knowledge_center_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class KnowledgeCenterView extends StatefulWidget {
  const KnowledgeCenterView({super.key});

  @override
  State<KnowledgeCenterView> createState() => _KnowledgeCenterViewState();
}

class _KnowledgeCenterViewState extends State<KnowledgeCenterView> {
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
      body: const KnowledgeCenterViewBody(),
    );
  }
}
