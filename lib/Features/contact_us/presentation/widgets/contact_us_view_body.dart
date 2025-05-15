import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/contact_us/domain/repos/contact_us_repo.dart';
import 'package:real_eye/Features/contact_us/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/contact_us_title_section.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/our_location_section.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/send_us_message_section.dart';
import 'package:real_eye/core/services/service_locator.dart';
import 'package:real_eye/core/widgets/custom_gradient_container.dart';
import 'package:real_eye/core/widgets/preserved_app_bar_margin.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainer(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const PreservedAppBarMargin(),
          const SliverToBoxAdapter(
            child: ContactUsTitleSection(),
          ),
          const SliverToBoxAdapter(
            child: OurLocationSection(),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => ContactUsCubit(getIt<ContactUsRepo>()),
              child: const SendUsMessageSection(),
            ),
          ),
        ],
      ),
    );
  }
}
