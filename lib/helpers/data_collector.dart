import 'dart:async';

import 'package:light/light.dart';

class LightCollector {
  static Light _light;
  static StreamSubscription _subscription;

  static void onData(int luxValue) async {
    print("Lux value from Light Sensor: $luxValue");
  }

  static void startListening() {
    _light = new Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  static void stopListening() {
    _subscription.cancel();
  }
}
