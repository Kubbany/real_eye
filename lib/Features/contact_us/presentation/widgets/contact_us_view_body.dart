import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/pinned_app_bar.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: getGradientDecoration(),
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 85,
                  ),
                ),
              ],
            ),
          ),
        ),
        const PinnedAppBar(),
      ],
    );
  }
}
