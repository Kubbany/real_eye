import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/domain/entities/plan_entity.dart';
import 'package:real_eye/Features/home/presentation/widgets/plans_title.dart';
import 'package:real_eye/Features/home/presentation/widgets/subscription_plans.dart';

class SubscriptionPlanSection extends StatelessWidget {
  const SubscriptionPlanSection({super.key});
  static const List<PlanEntity> plans = [
    PlanEntity(
      planType: "Free",
      price: "O",
      planPrivileges: [
        "3 Free Automations",
        "100 Tasks Per Month",
        "Two-Step Actions",
      ],
    ),
    PlanEntity(
      planType: "Pro-Plan",
      price: "29",
      planPrivileges: [
        "20 Free Automations",
        "1000 Tasks Per Month",
        "Two-Step Actions",
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        PlansTitle(),
        SizedBox(
          height: 40,
        ),
        SubscriptionPlans(
          plans: plans,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
