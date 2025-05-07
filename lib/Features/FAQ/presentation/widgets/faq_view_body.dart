import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/questions_list_view.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';
import 'package:real_eye/core/widgets/user_app_bar.dart';

class FAQViewBody extends StatelessWidget {
  const FAQViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        UserAppBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: CustomGradientHeader(
                            title: "FAQ",
                            titleSize: 40,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 15,
                        ),
                      ),
                      QuestionsListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
