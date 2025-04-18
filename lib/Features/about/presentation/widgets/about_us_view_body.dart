import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/presentation/widgets/about_us_section.dart';
import 'package:real_eye/Features/about/presentation/widgets/floating_image.dart';
import 'package:real_eye/Features/about/presentation/widgets/how_it_works_section.dart';
import 'package:real_eye/Features/about/presentation/widgets/our_mission_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
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
            ],
          ),
        ),
      ],
    );
  }
}
