# Flutter Spin Wheel SDK

A highly customizable Flutter spin wheel SDK for Android and iOS, perfect for games, giveaways, and interactive experiences.

## Author

Developed by ZP Design, Developer Zahir Patel.

## Features

- **API-Driven Results**: Predetermine the winning segment, ideal for server-side control.
- **Rich Customization**: Configure colors, gradients, images, text styles, and more for each segment.
- **Plugin System**: Extend the wheel with custom painters for advanced segment content like GIFs and Lottie animations.
- **Sound Effects**: Add sounds for spinning and winning to enhance user experience.
- **Confetti Celebration**: Trigger a confetti explosion when a prize is won.
- **Configurable Physics**: Adjust spin duration and resistance to match your desired feel.
- **Custom Widgets**: Use your own widgets for the wheel's pointer and center button.
- **Customizable Label Orientation**: Control text alignment globally (horizontal, radial, tangential) or set a specific rotation in degrees for each label individually.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_spin_wheel: ^latest
```

Then, install packages from the command line:

```shell
flutter pub get
```

## Getting Started

Here is a basic example of how to add a spin wheel to your app.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_spin_wheel/spin_wheel.dart';

class MyWheelScreen extends StatelessWidget {
  final _controller = SpinWheelController();
  final _labels = ['Prize 1', 'Prize 2', 'Prize 3', 'Prize 4', 'Prize 5', 'Prize 6'];

  @override
  Widget build(BuildContext context) {
    final config = SpinWheelConfig(
      divisions: _labels.length,
      labels: _labels,
      width: 300,
      height: 300,
      centerWidget: ElevatedButton(
        child: Text('Spin'),
        onPressed: () {
          // Spin to a random segment
          final randomIndex = (new Random()).nextInt(_labels.length);
          _controller.spin(randomIndex);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Spin Wheel Demo')),
      body: Center(
        child: SpinWheel(
          config: config,
          controller: _controller,
          onSpinEnd: (index) {
            print('Winner is: ${_labels[index]}');
            // You can show a dialog or navigate to a new screen here
          },
        ),
      ),
    );
  }
}
```

## Configuration (`SpinWheelConfig`)

Customize the appearance and behavior of the wheel. See the source code for a complete list of properties and their descriptions.

## Controller (`SpinWheelController`)

The controller provides a way to interact with the wheel programmatically.

### Methods

#### `spin(int targetIndex)`
Starts the spin animation and ensures the wheel lands on the specified `targetIndex`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
