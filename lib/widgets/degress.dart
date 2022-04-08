import 'package:custom_compass/repos/magnetometer.dart';
import 'package:flutter/material.dart';

class Degrees extends StatelessWidget {
  const Degrees(
      {Key? key,
      required this.magnetometerRepo,
      this.textStyle,
      this.showDegreesSimbol = true})
      : super(key: key);

  /// TextStyle for the text of the degrees
  final TextStyle? textStyle;

  /// Instance of a MagnetometerRepository
  final MagnetometerRepository magnetometerRepo;

  /// Decides whether to display the º symbol
  final bool showDegreesSimbol;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: magnetometerRepo.azStream,
        builder: (context, snapshot) {
          final data = snapshot.data!;
          return Text(
            data.floor().toString() + (showDegreesSimbol ? 'º' : ''),
            style: textStyle,
          );
        });
  }
}
