import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/domain/entities/plan_entity.dart';
import 'package:real_eye/Features/home/presentation/widgets/plan_actions.dart';
import 'package:real_eye/Features/home/presentation/widgets/plan_pricing.dart';
import 'package:real_eye/Features/home/presentation/widgets/plan_privileges.dart';

class SubscriptionPlanItem extends StatelessWidget {
  const SubscriptionPlanItem({super.key, required this.plan});
  final PlanEntity plan;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: getBorderSide(),
          bottom: getBorderSide(),
          left: getBorderSide(),
          right: getBorderSide(),
        ),
        color: Colors.black,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.white,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PlanPricing(planType: plan.planType, price: plan.price),
          const Text(
            "Get a glimpse of what our software is capable of. Just heads up and you will never leave us after this!",
          ),
          PlanPrivileges(titles: plan.planPrivileges),
          const PlanActions(),
        ],
      ),
    );
  }

  BorderSide getBorderSide() {
    return const BorderSide(
      color: Colors.grey,
      width: 1,
    );
  }
}
