import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/deep_fake_frame_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/description_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/free_trial_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/subscription_plan_section.dart';
import 'package:real_eye/core/widgets/custom_gradient_container.dart';
import 'package:real_eye/core/widgets/preserved_app_bar_margin.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGradientContainer(
      child: CustomScrollView(
        slivers: [
          PreservedAppBarMargin(),
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
    );
  }
}
