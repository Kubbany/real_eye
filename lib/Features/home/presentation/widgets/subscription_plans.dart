import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/domain/entities/plan_entity.dart';
import 'package:real_eye/Features/home/presentation/widgets/subscription_plan_item.dart';

class SubscriptionPlans extends StatelessWidget {
  const SubscriptionPlans({
    super.key,
    required this.plans,
  });

  final List<PlanEntity> plans;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        plans.length,
        (e) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: SubscriptionPlanItem(
            plan: plans[e],
          ),
        ),
      ),
    );
  }
}
