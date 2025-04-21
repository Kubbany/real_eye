import 'package:flutter/material.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/about_us_section.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/floating_image.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/how_it_works_section.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/meet_our_team_section.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/our_mission_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_gradient_container.dart';
import 'package:real_eye/core/widgets/preserved_app_bar_margin.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGradientContainer(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          PreservedAppBarMargin(),
          SliverToBoxAdapter(
            child: AboutUsSection(),
          ),
          SliverToBoxAdapter(
            child: OurMissionSection(),
          ),
          SliverToBoxAdapter(
            child: FloatingImage(
              child: Assets.imagesNeural,
            ),
          ),
          SliverToBoxAdapter(
            child: HowItWorksSection(),
          ),
          SliverToBoxAdapter(
            child: MeetOurTeamSection(),
          ),
        ],
      ),
    );
  }
}
