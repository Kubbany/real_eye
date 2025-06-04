// features/prediction/presentation/cubit/prediction_state.dart
part of 'chat_fake_detection_cubit.dart';

@immutable
sealed class ChatFakeDetectionStates {}

final class ChatFakeDetectionInitial extends ChatFakeDetectionStates {}

final class ChatFakeDetectionLoading extends ChatFakeDetectionStates {}

final class ChatFakeDetectionImageSuccess extends ChatFakeDetectionStates {
  final List<ImagePredictionEntity> response;

  ChatFakeDetectionImageSuccess({required this.response});
}

final class ChatFakeDetectionVideoSuccess extends ChatFakeDetectionStates {
  final List<VideoPredictionEntity> response;

  ChatFakeDetectionVideoSuccess({required this.response});
}

final class ChatFakeDetectionFailure extends ChatFakeDetectionStates {
  final String errorMessage;

  ChatFakeDetectionFailure({required this.errorMessage});
}
