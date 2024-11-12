import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  AppEnvironment._();

  factory AppEnvironment() {
    return _instance;
  }

  static final AppEnvironment _instance = AppEnvironment._();

  String get fileName => kDebugMode ? ".env.dev" : ".env.prod";
  static String get baseUrl => dotenv.get('BASE_URL', fallback: 'BASE_URL not found');
  static String get sentryDsn => dotenv.get('SENTRY_DSN', fallback: 'SENTRY_DSN not found');
  static String get rsaPrivateToken => dotenv.get('RSA_PRIVATE_TOKEN', fallback: 'RSA_PRIVATE_TOKEN not found');
  static String get apiLoginUsername => dotenv.get('API_LOGIN_USERNAME', fallback: 'API_LOGIN_USERNAME not found');
  static String get apiLoginPassword => dotenv.get('API_LOGIN_PASSWORD', fallback: 'API_LOGIN_PASSWORD not found');
}
