import 'package:custom_compass/repos/magnetometer.dart';
import 'package:flutter/material.dart';

class Compass extends StatelessWidget {
  const Compass({
    Key? key,
    required this.magnetometerRepo,
    required this.child,
    this.extraRotation = 0.0,
  }) : super(key: key);

  /// instance of a MagnetometerRepository
  final MagnetometerRepository magnetometerRepo;

  /// Widget
  final Widget child;

  /// extra degrees of rotation to snap an image or widget to north
  final double extraRotation;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: magnetometerRepo.azStream,
        builder: (context, snapshot) {
          final data = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Transform.rotate(
                  angle: (extraRotation + data) / 57.295779513,
                  child: child,
                ),
              ],
            ),
          );
        });
  }
}
