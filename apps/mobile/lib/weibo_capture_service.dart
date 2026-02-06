import 'dart:async';

class WeiboCaptureService {
  WeiboCaptureService({required this.interval});

  final Duration interval;
  Timer? _timer;
  Timer? _initialTimer;

  void start() {
    _timer?.cancel();
    _initialTimer?.cancel();
    final now = DateTime.now();
    final minutesSinceMidnight = now.hour * 60 + now.minute;
    final intervalMinutes = interval.inMinutes;
    final remainder = minutesSinceMidnight % intervalMinutes;
    final minutesUntilNext = remainder == 0 ? 0 : intervalMinutes - remainder;
    final nextTick = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    ).add(Duration(minutes: minutesUntilNext));
    final initialDelay = nextTick.difference(now);

    _initialTimer = Timer(initialDelay, () {
      _captureAndUpload();
      _timer = Timer.periodic(interval, (_) => _captureAndUpload());
    });
  }

  void stop() {
    _timer?.cancel();
    _initialTimer?.cancel();
    _timer = null;
    _initialTimer = null;
  }

  Future<void> _captureAndUpload() async {
    // TODO: Integrate with Android APIs to open Weibo, capture data, and upload.
  }
}
