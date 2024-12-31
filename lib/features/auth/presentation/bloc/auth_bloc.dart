import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/repos/auth_repositoryies_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState.initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepositoryImpl authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  
  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final response = await authRepository.login(
      loginRequest: LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await response.when(
      success: (data) async {
        final token = data.data?.login?.accessToken ?? '';
        final refreshToken = data.data?.login?.refreshToken ?? '';
        await serviceLocator<SharedPreferences>().setString(
          PrefKeys.accessToken,
          token,
        );
        await serviceLocator<SharedPreferences>().setString(
          PrefKeys.refreshToken,
          refreshToken,
        );
        final userRole = await _getUserRole(token);
        emit(AuthState.success(data, userRole: userRole));
      },
      failure: (error) {
        emit(AuthState.error(error.message.toString()));
      },
    );
  }

  Future<String?> _getUserRole(String token) async {
    final userRole = await authRepository.getUserRole(token: token);
    return userRole.when(
      success: (data) {
        serviceLocator<SharedPreferences>().setInt(
          PrefKeys.userRole,
          data.userId ?? 0,
        );
        return data.userRole;
      },
      failure: (error) {
        return null;
      },
    );
  }
}
