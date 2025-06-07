import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/manager/cubits/chat_cubit/chat_cubit.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/prediction_response.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/video_player.dart';

class MessageContent extends StatelessWidget {
  final ChatMessage message;

  const MessageContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(message.content ?? '');
      case MessageType.image:
        return message.file != null ? Image.file(message.file!, height: 150) : const SizedBox();
      case MessageType.video:
        return message.file != null
            ? SizedBox(
                height: 150,
                child: VideoPlayerWidget(file: message.file!),
              )
            : const SizedBox();
      case MessageType.imageUrl:
        return message.url != null ? Image.network(message.url!, height: 150) : const SizedBox();
      case MessageType.predictionResult:
        return BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatMessagesUpdated) {
              log("Success");
              return PredictionResponseContainer(message: message);
            } else if (state is ChatError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is ChatLoading) {
              log("Loading");
              return const Center(
                child: Text(
                  "Processing",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
    }
  }
}
