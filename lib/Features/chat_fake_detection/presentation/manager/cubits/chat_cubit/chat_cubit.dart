// features/chat/presentation/cubit/chat_cubit.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';

import 'package:real_eye/Features/chat_fake_detection/presentation/manager/cubits/chat_fake_detection_cubit/chat_fake_detection_cubit.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';

part 'chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatFakeDetectionCubit chatFakeDetectionCubit;

  ChatCubit({
    required this.chatFakeDetectionCubit,
  }) : super(ChatInitial());

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendTextMessage(String text) {
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.text,
      content: text,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));
  }

  Future<void> sendImageMessage(File image) async {
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.image,
      file: image,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));

    // Get prediction
    await chatFakeDetectionCubit.predictImage(image);
  }

  Future<void> sendVideoMessage(File video) async {
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.video,
      file: video,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));

    // Get prediction
    await chatFakeDetectionCubit.predictVideo(video);
  }

  Future<void> sendImageUrlMessage(String url) async {
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.imageUrl,
      url: url,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));

    // Get prediction
    await chatFakeDetectionCubit.predictFromUrl(url);
  }

  void addPredictionResults({
    List<ImagePredictionEntity>? imagePredictions,
    List<VideoPredictionEntity>? videoPredictions,
  }) {
    if (_messages.isEmpty) return;

    final lastMessage = _messages.last;
    final updatedMessage = ChatMessage(
      id: lastMessage.id,
      type: lastMessage.type,
      content: lastMessage.content,
      file: lastMessage.file,
      url: lastMessage.url,
      timestamp: lastMessage.timestamp,
      isUser: lastMessage.isUser,
      imagePredictions: imagePredictions,
      videoPredictions: videoPredictions,
    );

    _messages[_messages.length - 1] = updatedMessage;
    emit(ChatMessagesUpdated(messages: List.from(_messages)));
  }
}
