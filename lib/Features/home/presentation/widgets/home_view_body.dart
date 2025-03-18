import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/description_section.dart';
import 'package:real_eye/Features/home/presentation/widgets/free_trial_section.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FreeTrialSection(),
              ),
              SliverToBoxAdapter(
                child: DescriptionSection(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
