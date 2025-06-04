// features/prediction/presentation/cubit/prediction_state.dart
part of 'chat_fake_detection_cubit.dart';

@immutable
sealed class ChatFakeDetectionStates {}

final class ChatFakeDetectionInitial extends ChatFakeDetectionStates {}

final class ChatFakeDetectionLoading extends ChatFakeDetectionStates {}

final class ChatFakeDetectionSuccess extends ChatFakeDetectionStates {
  final List<ImagePredictionEntity> response;

  ChatFakeDetectionSuccess({required this.response});
}

final class ChatFakeDetectionFailure extends ChatFakeDetectionStates {
  final String errorMessage;

  ChatFakeDetectionFailure({required this.errorMessage});
}
