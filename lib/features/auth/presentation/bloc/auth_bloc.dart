
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/repos/auth_repositoryies_impl.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepositoryImpl authRepositoryImpl})
      : _authRepositoryImpl = authRepositoryImpl,
        super(const AuthState.initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepositoryImpl _authRepositoryImpl;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final response = await _authRepositoryImpl.login(
      loginRequest: LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await response.when(
      success: (data) async {
        final token = data.data?.login?.accessToken ?? '';
        final refreshToken = data.data?.login?.refreshToken ?? '';
        await SharedPref.setString(
          PrefKeys.accessToken,
          token,
        );
        await SharedPref.setString(
          PrefKeys.refreshToken,
          refreshToken,
        );
        final userRole = await _getUserRole(token);
     
        emit(
          AuthState.loginSuccess(
            response: data,
            userRole: userRole,
          ),
        );
      },
      failure: (error) {
        emit(
          AuthState.error(
            error.errors?.first.extensions?.originalError?.message ?? '',
          ),
        );
      },
    );
  }

  Future<String?> _getUserRole(String token) async {
    final userRole = await _authRepositoryImpl.getUserRole(token: token);
    return userRole.whenOrNull(
      success: (data) {
        SharedPref.setInt(
          PrefKeys.userRole,
          data.userId ?? 0,
        );
        return data.userRole;
      },
      failure: (error) {
        return error.message;
      },
    );
  }
}
