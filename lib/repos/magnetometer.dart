import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

class MagnetometerRepository {
  //List<double>? magnetometerValues;
  double az = 0.0;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  final StreamController<double> _azController = StreamController<double>.broadcast();
  Stream<double> get azStream => _azController.stream;

  MagnetometerRepository() {
    init();
  }

  void init() {
    _streamSubscriptions.add(magnetometerEvents.listen(
      (MagnetometerEvent event) {
        //magnetometerValues = <double>[event.x, event.y, event.z];
        az = 90 - atan2(event.y, event.x) * 180 / pi;
        _azController.sink.add(az);
        az = az;
      },
    ));
  }
}
