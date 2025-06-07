import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:real_eye/Features/chat_fake_detection/presentation/manager/cubits/chat_cubit/chat_cubit.dart';

class MediaUploadTextField extends StatefulWidget {
  const MediaUploadTextField({super.key});

  @override
  State<MediaUploadTextField> createState() => _MediaUploadTextFieldState();
}

class _MediaUploadTextFieldState extends State<MediaUploadTextField> {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _textController,
        onSubmitted: _handleSendMessage,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff111111),
          border: _getBorder(),
          enabledBorder: _getBorder(),
          focusedBorder: _getBorder(),
          hintText: "Paste media URL or type a message...",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: PopupMenuButton<String>(
            icon: const Icon(Icons.attach_file, color: Colors.grey),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'image',
                child: Row(
                  children: [
                    Icon(Icons.photo, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Upload Image'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'video',
                child: Row(
                  children: [
                    Icon(Icons.video_library, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Upload Video'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'image') {
                _pickImage();
              } else if (value == 'video') {
                _pickVideo();
              }
            },
          ),
          suffixIcon: IconButton(
            onPressed: () => _handleSendMessage(_textController.text),
            icon: const Icon(Icons.send, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (mounted) {
        context.read<ChatCubit>().sendImageMessage(File(pickedFile.path));
      }
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (mounted) {
        context.read<ChatCubit>().sendVideoMessage(File(pickedFile.path));
      }
    }
  }

  void _handleSendMessage(String text) {
    if (text.trim().isEmpty) return;

    if (Uri.tryParse(text)?.hasAbsolutePath ?? false) {
      context.read<ChatCubit>().sendImageUrlMessage(text);
    } else {
      context.read<ChatCubit>().sendTextMessage(text);
    }

    _textController.clear();
  }
}
