import 'package:flutter/material.dart';

class MediaUploadTextField extends StatelessWidget {
  const MediaUploadTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (data) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff111111),
        border: getBorder(),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(),
        hintText: "Paste media URL...",
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.attach_file),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
    );
  }
}
