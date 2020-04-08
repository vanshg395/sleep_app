import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:light/light.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:sensors/sensors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

class CSVCreator {
  static Timer t1;
  static int l;
  static double s;
  static double m;

  static List<List<dynamic>> data = [
    ['light', 'sound', 'motion'],
  ];
  static void recordData() {
    t1 = Timer.periodic(Duration(minutes: 1), (timer) {
      data.add([l, s, m]);
    });
  }

  static Future<void> stopRecording() async {
    t1.cancel();
    print(data);
    Directory directory = await getExternalStorageDirectory();
    String filePath = directory.absolute.path + '/userdata';
    print(filePath);
    File f = File(filePath + 'set${DateTime.now().toIso8601String()}.csv');
    String csv = const ListToCsvConverter().convert(data);
    f.writeAsString(csv);
  }
}

class LightCollector {
  static Light _light;
  static StreamSubscription _subscription;

  static void startListening() {
    try {
      _light = new Light();
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  static void onData(int luxValue) async {
    CSVCreator.l = luxValue;
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
    CSVCreator.s = noiseReading.db;

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

class MotionCollector {
  static StreamSubscription _subscription;

  static void startListening() {
    try {
      _subscription = userAccelerometerEvents.listen((event) {
        CSVCreator.m =
            sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));
        print(event.x);
        print(event.y);
        print(event.z);
      });
    } catch (e) {}
  }

  static void stopListening() {
    _subscription.cancel();
  }
}
