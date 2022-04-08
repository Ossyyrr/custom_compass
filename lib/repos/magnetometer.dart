import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

class MagnetometerRepository {
  /// Degrees with respect to north
  double az = 0.0;

  /// subscription to listen for changes in the magnetometerEvent
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  /// Controller for az
  final StreamController<double> _azController =
      StreamController<double>.broadcast();

  /// Stream to show the changes that are made in the controller
  Stream<double> get azStream => _azController.stream;

  /// Listen initialization in repository constructor
  MagnetometerRepository() {
    init();
  }

  /// Initialization of the listen and update of the controller and variables
  void init() {
    _streamSubscriptions.add(magnetometerEvents.listen(
      (MagnetometerEvent event) {
        az = 90 - atan2(event.y, event.x) * 180 / pi;
        _azController.sink.add(az);
        az = az;
      },
    ));
  }
}
