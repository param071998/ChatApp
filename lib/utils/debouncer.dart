import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {

    cancelTimer();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
  cancelTimer()
  {
    _timer?.cancel();
  }
}
