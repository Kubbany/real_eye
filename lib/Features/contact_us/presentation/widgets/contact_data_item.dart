import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/domain/entities/contact_data_entity.dart';

class ContactDataItem extends StatelessWidget {
  const ContactDataItem({
    super.key,
    required this.contact,
  });
  final ContactDataEntity contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(contact.icon),
      title: Text(
        contact.contactData,
      ),
    );
  }
}
