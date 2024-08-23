import 'package:flutter/services.dart';

class AppServices {
  static const platform = MethodChannel('flutter.dev/connectivity');

  static Future<bool> checkConnectivity() async {
    try {
      final result = await platform.invokeMethod<int>('checkConnectivity');

      if (result == 1) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      print('Failed to check connectivity: ${e.message}');
      return false; // Or handle it based on your application's needs
    }
  }
}
