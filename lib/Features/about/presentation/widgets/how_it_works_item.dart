import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/domain/entities/how_it_work_entity.dart';

class HowItWorksItem extends StatelessWidget {
  const HowItWorksItem({
    super.key,
    required this.item,
  });
  final HowItWorkEntity item;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.35,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        padding: const EdgeInsets.all(
          16,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff101725),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
