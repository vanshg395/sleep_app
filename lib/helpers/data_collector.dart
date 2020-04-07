import 'dart:async';

import 'package:light/light.dart';
import 'package:noise_meter/noise_meter.dart';

class LightCollector {
  static Light _light;
  static StreamSubscription _subscription;

  static void startListening() {
    _light = new Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  static void onData(int luxValue) async {
    print("Lux value from Light Sensor: $luxValue" +
        '   ' +
        DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString());
  }

  static void stopListening() {
    _subscription.cancel();
  }
}

class SoundCollector {
  static bool _isRecording = false;
  static StreamSubscription<NoiseReading> _noiseSubscription;
  static NoiseMeter _noiseMeter;

  static void startRecorder() async {
    try {
      _noiseMeter = new NoiseMeter();
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } on NoiseMeterException catch (exception) {
      print(exception);
    }
  }

  static void onData(NoiseReading noiseReading) {
    if (!_isRecording) {
      _isRecording = true;
    }

    /// Do someting with the noiseReading object
    print(noiseReading.toString() +
        '   ' +
        DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString());
  }

  static void stopRecorder() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription.cancel();
        _noiseSubscription = null;
      }
      _isRecording = false;
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }
}
