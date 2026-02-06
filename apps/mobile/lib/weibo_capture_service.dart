import 'dart:async';

import 'android_bridge.dart';

class WeiboCaptureService {
  WeiboCaptureService({
    required this.interval,
    AndroidBridge? androidBridge,
  }) : _androidBridge = androidBridge ?? AndroidBridge();

  final Duration interval;
  final AndroidBridge _androidBridge;
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
    // TODO: Use Android Accessibility APIs to open Weibo, capture data, and upload.
    try {
      await _androidBridge.openWeiboAndEnterTopic(topicName: '超话');
      final superLikeCount = await _androidBridge.readSuperLikeCount();
      if (superLikeCount == null) {
        await _androidBridge.reportCaptureStatus(
          success: false,
          message: 'Super Like count not found.',
        );
        return;
      }
      await _androidBridge.reportCaptureStatus(
        success: true,
        message: 'Captured Super Like count: $superLikeCount',
      );
    } catch (error) {
      await _androidBridge.reportCaptureStatus(
        success: false,
        message: error.toString(),
      );
    }
  }
}
