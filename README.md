
## Custom Compass

Create a custom compass from a widget.

## Usage
```
late final magnetometerRepo = MagnetometerRepository();

Degrees(
    magnetometerRepo: magnetometerRepo,
    textStyle: const TextStyle(fontSize: 22),
    showDegreesSimbol: true,
),

Compass(
    magnetometerRepo: magnetometerRepo,
    child: const Icon(
    Icons.arrow_circle_up,
    size: 50,
    ),
),
```