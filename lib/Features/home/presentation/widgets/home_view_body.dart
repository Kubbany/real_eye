import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/deep_fake_frame_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/description_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/free_trial_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/subscription_plan_section.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/pinned_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
                SliverToBoxAdapter(
                  child: FreeTrialSection(),
                ),
                SliverToBoxAdapter(
                  child: DeepFakeFrameSection(),
                ),
                SliverToBoxAdapter(
                  child: DescriptionSection(),
                ),
                SliverToBoxAdapter(
                  child: SubscriptionPlanSection(),
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
