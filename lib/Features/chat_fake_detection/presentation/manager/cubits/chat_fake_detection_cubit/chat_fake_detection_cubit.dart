// features/prediction/presentation/cubit/prediction_cubit.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'chat_fake_detection_states.dart';

class ChatFakeDetectionCubit extends Cubit<ChatFakeDetectionStates> {
  final ChatFakeDetectionRepo chatFakeDetectionRepo;

  ChatFakeDetectionCubit(this.chatFakeDetectionRepo) : super(ChatFakeDetectionInitial());

  Future<void> predictImage(File image) async {
    safeEmit(ChatFakeDetectionLoading());
    final result = await chatFakeDetectionRepo.predictImage(image);
    switch (result) {
      case Success():
        safeEmit(ChatFakeDetectionImageSuccess(response: result.data));
      case Fail(:final fail):
        safeEmit(ChatFakeDetectionFailure(errorMessage: fail.errorMessage));
    }
  }

  Future<void> predictVideo(File video) async {
    safeEmit(ChatFakeDetectionLoading());
    final result = await chatFakeDetectionRepo.predictVideo(video);
    switch (result) {
      case Success():
        safeEmit(ChatFakeDetectionVideoSuccess(response: result.data));
      case Fail(:final fail):
        safeEmit(ChatFakeDetectionFailure(errorMessage: fail.errorMessage));
    }
  }
}
