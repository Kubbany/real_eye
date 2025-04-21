import 'package:flutter/material.dart';

class ActionsEntity {
  final String title;
  final VoidCallback onPressed;

  const ActionsEntity({required this.title, required this.onPressed});
}
