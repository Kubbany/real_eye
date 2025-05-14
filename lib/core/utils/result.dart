import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_eye/core/errors/failure.dart' as f;

part 'result.freezed.dart';

@Freezed()

///  A class that represents the result of a operation.
abstract class Result<T> with _$Result<T> {
  /// A class that represents the success result of a operation.
  const factory Result.success(T data) = Success<T>;

  /// A class that represents the fail result of a operation.
  const factory Result.failure(f.Failure failure) = Failure<T>;
}
