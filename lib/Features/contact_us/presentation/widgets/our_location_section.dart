import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/contact_data_list.dart';

class OurLocationSection extends StatelessWidget {
  const OurLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 45,
          ),
          Text(
            "Our Location",
            style: TextStyle(
              color: Color(0xFF1A40C4),
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "We are located at Ain Shams University, Cairo, Egypt.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ContactDataList(),
        ],
      ),
    );
  }
}
