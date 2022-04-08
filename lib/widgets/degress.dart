import 'package:compass/helpers/repos/magnetometer.dart';
import 'package:flutter/material.dart';

class Degrees extends StatelessWidget {
  const Degrees({Key? key, required this.magnetometerRepo, this.textStyle, this.showDegreesSimbol = true})
      : super(key: key);
  final TextStyle? textStyle;
  final MagnetometerRepository magnetometerRepo;
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
