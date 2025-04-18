import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/deep_fake_frame_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/description_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/free_trial_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/subscription_plan_section.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomAppBar(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.grey.shade900,
                  Colors.black,
                ],
              ),
            ),
            child: const CustomScrollView(
              slivers: [
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
      ],
    );
  }
}
