import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/contact_us_title_section.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/our_location_section.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/send_us_message_section.dart';
import 'package:real_eye/core/widgets/custom_gradient_container.dart';
import 'package:real_eye/core/widgets/preserved_app_bar_margin.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGradientContainer(
      child: CustomScrollView(
        slivers: [
          PreservedAppBarMargin(),
          SliverToBoxAdapter(
            child: ContactUsTitleSection(),
          ),
          SliverToBoxAdapter(
            child: OurLocationSection(),
          ),
          SliverToBoxAdapter(
            child: SendUsMessageSection(),
          ),
        ],
      ),
    );
  }
}
