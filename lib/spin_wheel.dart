/// Main SpinWheel widget for the SDK

library spin_wheel;

export 'spin_wheel_controller.dart';
export 'spin_wheel_config.dart';
export 'spin_wheel_renderer.dart';
export 'spin_wheel_label_alignment.dart';

import 'package:flutter/widgets.dart';
import 'spin_wheel_renderer.dart';
import 'spin_wheel_config.dart';
import 'spin_wheel_controller.dart';

/// The main widget that renders the spin wheel, pointer, and center widget.
class SpinWheel extends StatelessWidget {
    /// The configuration that defines the appearance and behavior of the wheel.
  final SpinWheelConfig config;
    /// The controller used to programmatically spin the wheel.
  final SpinWheelController controller;
    /// A callback function that is invoked when the spin animation completes.
  /// It provides the index of the winning segment.
  final void Function(int selectedIndex)? onSpinEnd;

    /// Creates a new SpinWheel widget.
  const SpinWheel({
    Key? key,
    required this.config,
    required this.controller,
    this.onSpinEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SpinWheelRenderer(
          config: config,
          controller: controller,
          onSpinEnd: onSpinEnd,
        ),
        if (config.pointerWidget != null)
          Align(
            // Positions the pointer on the right edge, pointing inwards.
            // The Alignment values can be tweaked for precise positioning.
            alignment: config.pointerAlignment,
            child: config.pointerWidget,
          ),
      ],
    );
  }
}

