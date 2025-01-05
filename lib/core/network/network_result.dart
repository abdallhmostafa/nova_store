import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_result.freezed.dart';

@Freezed()
abstract class NetworkResult<T, E> with _$NetworkResult<T, E> {
  const factory NetworkResult.success(T data) = Success<T,E>;

  const factory NetworkResult.failure({
    required E error,
  }) = Failure<T,E>;
}
