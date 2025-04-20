import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/domain/entities/contact_data_entity.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/contact_data_item.dart';

class ContactDataList extends StatelessWidget {
  const ContactDataList({super.key});
  static const List<ContactDataEntity> contacts = [
    ContactDataEntity(
      icon: Icons.location_pin,
      contactData: "ASU, Cairo, Egypt",
    ),
    ContactDataEntity(
      icon: Icons.phone,
      contactData: "+201234567890",
    ),
    ContactDataEntity(
      icon: Icons.email,
      contactData: "support@realeye.com",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        contacts.length,
        (e) => ContactDataItem(
          contact: contacts[e],
        ),
      ),
    );
  }
}
