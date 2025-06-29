import 'package:meta/meta.dart';

/// Controller for managing spin logic

typedef SpinCallback = void Function(int targetIndex);

/// A controller to programmatically trigger the spin animation on a [SpinWheel].
class SpinWheelController {
  SpinCallback? _spinCallback;

    /// Initiates the spin animation to land on the specified [targetIndex].
  void spin(int targetIndex) {
    _spinCallback?.call(targetIndex);
  }

  // Called by the widget to register the callback
    /// Registers the internal spin callback. This is used by the [SpinWheel]
  /// widget and should not be called directly by application code.
  @protected
  void registerSpinCallback(SpinCallback callback) {
    _spinCallback = callback;
  }
}
