class PlanEntity {
  final String planType, price;
  final List<String> planPrivileges;

  const PlanEntity({
    required this.planType,
    required this.price,
    required this.planPrivileges,
  });
}
