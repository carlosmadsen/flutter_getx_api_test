import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  AppEnv(this._env);

  final DotEnv _env;
  Future<String> get apiBaseUrl async => await _get('apiBaseUrl');
  Future<String> get endPointFriends async => await _get('endPointFriends');

  Future<String> _get(String name) async {
    if (!_env.isInitialized) {
      print('inicilizando o env');
      await _env.load(fileName: '.env');
    }
    return _env.env[name] ?? '';
  }
}
