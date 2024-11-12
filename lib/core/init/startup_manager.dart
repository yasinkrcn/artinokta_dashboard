import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tv_artinokta/core/const/app_environment.dart';
import 'package:tv_artinokta/core/init/injection_container.dart' as locator;

class StartupManager {
  // Private constructor for Singleton pattern
  StartupManager._internal();

  // Singleton instance
  static final StartupManager _instance = StartupManager._internal();

  // Getter for Singleton instance
  static StartupManager get instance => _instance;

  // Method to initialize the application
  static Future<void> initialize() async {
    // Ensures that widget binding is initialized before running the app
    WidgetsFlutterBinding.ensureInitialized();

    // // Sets preferred device orientation to portrait
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // // Hide status bar and navigation bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Runs the initialization code within a guarded zone to catch errors
    await runZonedGuarded<Future<void>>(
      _init,
      (error, stack) => _handleError(error, stack),
    );
  }

  // Private method to perform the initialization tasks
  static Future<void> _init() async {
    try {
      // Loads environment variables from the .env file specified by the current app environment (e.g., development, staging, production)
      await dotenv.load(fileName: AppEnvironment().fileName);

      // Initializes all the services and dependencies required by the app
      await locator.init();
    } catch (e, stack) {
      // Handles any errors that occur during initialization
      _handleError(e, stack);
    }
  }

  // Method to handle errors and log them appropriately
  static void _handleError(Object error, StackTrace stack) {
    if (kDebugMode) {
      // Prints error and stack trace to the console in debug mode
      print('Error: $error');
      print('Stack trace: $stack');
    } else {
      // Log errors to an external service in release mode (e.g., Sentry, Firebase Crashlytics)
    }
  }
}
