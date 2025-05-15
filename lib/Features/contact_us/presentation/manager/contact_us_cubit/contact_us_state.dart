part of 'contact_us_cubit.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const factory ContactUsState.initial() = _Initial;
  const factory ContactUsState.loading() = _Loading;
  const factory ContactUsState.failure(String message) = _Failure;
  const factory ContactUsState.success() = _Success;
}

extension ResultWhenExtension<T> on ContactUsState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function() success,
    required R Function(String message) failure,
  }) {
    return switch (this) {
      _Initial() => initial(),
      _Loading() => loading(),
      _Success() => success(),
      _Failure(message: final message) => failure(message),
      ContactUsState() => throw UnimplementedError(),
    };
  }
}
