import 'package:nova_store/features/auth/data/model/login/login_request.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_request_model.dart';

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

  Map<String, dynamic> signUpGraphql({
    required SignUpRequestModel signUpRequest,
  }) {
    return {
      'query': r'''
   mutation SignUp($email: String!, $password: String!, $name: String!, $avatar: String!) {
	addUser(
		data: {
			name: $name
			email: $email
			password: $password
			avatar: $avatar
		}
	) {
		id
		name
		avatar
	}
}
      ''',
      'variables': {
        'email': signUpRequest.email,
        'password': signUpRequest.password,
        'name': signUpRequest.name,
        'avatar': signUpRequest.avatar,
      },
    };
  }
}
