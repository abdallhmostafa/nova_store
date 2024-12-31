part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _LoadingState;
  const factory AuthState.success(dynamic response ,{String? userRole}) = _SuccessState;
  const factory AuthState.error(String message) = _ErrorState;
}
