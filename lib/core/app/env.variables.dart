import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, production }

class EnvVariable {
  factory EnvVariable() => instance;
  EnvVariable._();
  static final instance = EnvVariable._();

  String _envType = '';
  Future<void> init({required EnvTypeEnum env}) async {
    switch (env) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.production:
        await dotenv.load(fileName: '.env.production');
    }
    _envType = dotenv.get('ENV_TEYP');
  }

  String get envType => _envType;
}
