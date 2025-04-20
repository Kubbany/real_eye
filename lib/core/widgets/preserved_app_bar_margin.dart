import 'package:flutter/material.dart';

class PreservedAppBarMargin extends StatelessWidget {
  const PreservedAppBarMargin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 85,
      ),
    );
  }
}
