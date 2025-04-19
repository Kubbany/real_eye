import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/presentation/widgets/about_us_section.dart';
import 'package:real_eye/Features/about/presentation/widgets/floating_image.dart';
import 'package:real_eye/Features/about/presentation/widgets/how_it_works_section.dart';
import 'package:real_eye/Features/about/presentation/widgets/meet_our_team_section.dart';
import 'package:real_eye/Features/about/presentation/widgets/our_mission_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
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
                  child: SizedBox(
                    height: 85,
                  ),
                ),
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
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppBar(),
        ),
      ],
    );
  }
}
