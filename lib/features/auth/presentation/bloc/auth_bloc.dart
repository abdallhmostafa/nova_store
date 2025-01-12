import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/helper/secure_storage_helper.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/features/auth/data/model/login/login_request.dart';
import 'package:nova_store/features/auth/data/model/login/login_response.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_request_model.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_response_model.dart';
import 'package:nova_store/features/auth/data/repos/auth_repositoryies_impl.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepositoryImpl authRepositoryImpl})
      : _authRepositoryImpl = authRepositoryImpl,
        super(const AuthState.initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }
  final AuthRepositoryImpl _authRepositoryImpl;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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
        unawaited(_saveToken(token, refreshToken));
        log('token: $token');
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
            error.errors?.first.message ?? '',
          ),
        );
      },
    );
  }

  Future<String?> _getUserRole(String token) async {
    final userRole = await _authRepositoryImpl.getUserRole(token: token);
    return userRole.whenOrNull(
      success: (data) {
        serviceLocator<SecureStorageHelper>().save(
          key: PrefKeys.userRoleId,
          value: data.userId.toString(),
        );
        serviceLocator<SecureStorageHelper>().save(
          key: PrefKeys.userRole,
          value: data.userRole!,
        );
        return data.userRole;
      },
      failure: (error) {
        log('error: ${error.message}');
        return error.message;
      },
    );
  }

  Future<void> _saveToken(String token, String refreshToken) async {
    await serviceLocator<SecureStorageHelper>().save(
      key: PrefKeys.accessToken,
      value: token,
    );
    await serviceLocator<SecureStorageHelper>().save(
      key: PrefKeys.refreshToken,
      value: refreshToken,
    );
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final response = await _authRepositoryImpl.signUp(
      signUpRequest: SignUpRequestModel(
        avatar: event.imageUrl,
        email: emailController.text.trim(),
        password: passwordController.text,
        name: nameController.text.trim(),
      ),
    );

    response.when(
      success: (data) {
        add(
          const AuthEvent.login(),
        );
        emit(
          AuthState.signUpSuccess(
            response: data,
          ),
        );
      },
      failure: (error) {
        emit(AuthState.error(error.errors?.first.message ?? ''));
      },
    );
  }
}
