import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helpers/data_collector.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconButton(
            iconSize: 100,
            alignment: Alignment.center,
            icon: Icon(
              Icons.play_circle_outline,
              color: Color(0xFF4767EB),
            ),
            onPressed: _isListening
                ? null
                : () async {
                    print('hey');
                    setState(() {
                      _isListening = true;
                    });
                    await Permission.microphone.request();
                    await Permission.activityRecognition.request();
                    await Permission.storage.request();
                    LightCollector.startListening();
                    SoundCollector.startRecorder();
                    MotionCollector.startListening();
                    CSVCreator.recordData();
                  },
          ),
          IconButton(
            iconSize: 100,
            alignment: Alignment.center,
            icon: Icon(
              Icons.pause_circle_outline,
              color: Color(0xFF4767EB),
            ),
            onPressed: _isListening
                ? () async {
                    print('hey');
                    setState(() {
                      _isListening = false;
                    });
                    LightCollector.stopListening();
                    SoundCollector.stopRecorder();
                    MotionCollector.stopListening();
                    CSVCreator.stopRecording();
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
