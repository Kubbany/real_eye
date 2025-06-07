// features/chat/presentation/cubit/chat_cubit.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';

import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatFakeDetectionRepo chatFakeDetectionRepo;

  ChatCubit({
    required this.chatFakeDetectionRepo,
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
    safeEmit(ChatLoading());
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.image,
      file: image,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));
    final result = await chatFakeDetectionRepo.predictImage(image);
    result.when(
      success: (predictions) {
        // 3. Add API response message
        final apiMessage = ChatMessage(
          id: 'pred_${DateTime.now().millisecondsSinceEpoch}',
          type: MessageType.text,
          content: _formatPredictions(predictions),
          timestamp: DateTime.now(),
          isUser: false,
          imagePredictions: predictions,
        );
        _addMessage(apiMessage);
      },
      failure: (failure) {
        safeEmit(ChatError(errorMessage: failure.errorMessage));
      },
    );

    // Get prediction
  }

  // chat_cubit.dart
  Future<void> sendVideoMessage(File video) async {
    safeEmit(ChatLoading());
    // 1. Add user message immediately
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: MessageType.video,
      file: video,
      timestamp: DateTime.now(),
      isUser: true,
    );
    _addMessage(message);

    // 2. Get prediction
    final result = await chatFakeDetectionRepo.predictVideo(video);

    result.when(
      success: (predictions) {
        // 3. Add API response message
        final apiMessage = ChatMessage(
          id: 'pred_${DateTime.now().millisecondsSinceEpoch}',
          type: MessageType.predictionResult,
          timestamp: DateTime.now(),
          isUser: false,
          isPrediction: true,
          videoPredictions: predictions,
        );
        _addMessage(apiMessage);
      },
      failure: (failure) {
        // Add error message to chat
        final errorMessage = ChatMessage(
          id: 'err_${DateTime.now().millisecondsSinceEpoch}',
          type: MessageType.text,
          content: 'Analysis failed: ${failure.errorMessage}',
          timestamp: DateTime.now(),
          isUser: false,
        );
        _addMessage(errorMessage);
      },
    );
  }

  Future<void> sendImageUrlMessage(String url) async {
    safeEmit(ChatLoading());
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
    final result = await chatFakeDetectionRepo.predictFromUrl(url);
    result.when(
      success: (predictions) {
        // 3. Add API response message
        final apiMessage = ChatMessage(
          id: 'pred_${DateTime.now().millisecondsSinceEpoch}',
          type: MessageType.text,
          content: _formatPredictions(predictions),
          timestamp: DateTime.now(),
          isUser: false,
          imagePredictions: predictions,
        );
        _addMessage(apiMessage);
      },
      failure: (failure) {
        safeEmit(ChatError(errorMessage: failure.errorMessage));
      },
    );
  }

  String _formatPredictions(predictions) {
    return predictions.map((p) => '${p.model}: ${p.prediction} (${p.confidence})').join('\n');
  }

  void _addMessage(ChatMessage message) {
    _messages.add(message);
    safeEmit(ChatMessagesUpdated(messages: List.from(_messages)));
  }
}
