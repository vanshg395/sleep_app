import 'package:flutter/material.dart';

import '../helpers/data_collector.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep App'),
      ),
      body: Center(
        child: IconButton(
          iconSize: 100,
          alignment: Alignment.center,
          icon: Icon(
            Icons.play_circle_outline,
            color: Color(0xFF4767EB),
          ),
          onPressed: () {
            print('hey');
            LightCollector.startListening();
          },
        ),
      ),
    );
  }
}
