import 'package:nova_store/features/auth/data/model/login_request.dart';

class AuthGraphql {
  factory AuthGraphql() => _instance;
  AuthGraphql._();
  static final AuthGraphql _instance = AuthGraphql._();

  Map<String, dynamic> loginGraphql({required LoginRequest loginRequest}) {
    return {
      'query': r'''
       mutation login($email: String!, $password: String!) {
	    login(email: $email, password: $password) {
            access_token
            refresh_token
      }
      }
      ''',
      'variables': {
        'email': loginRequest.email,
        'password': loginRequest.password,
      },
    };
  }
}
