import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_eye/core/errors/failure.dart';

part 'result.freezed.dart';

@Freezed()

///  A class that represents the result of a operation.
abstract class Result<T> with _$Result<T> {
  /// A class that represents the success result of a operation.
  const factory Result.success(T data) = Success<T>;

  /// A class that represents the fail result of a operation.
  const factory Result.fail(Failure fail) = Fail<T>;
}

extension ResultWhenExtension<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      Success<T>(data: final data) => success(data),
      Fail<T>(fail: final fail) => failure(fail),
      Result() => throw UnimplementedError(),
    };
  }
}
