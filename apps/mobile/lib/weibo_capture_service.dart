import 'dart:async';

class WeiboCaptureService {
  WeiboCaptureService({required this.interval});

  final Duration interval;
  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => _captureAndUpload());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _captureAndUpload() async {
    // TODO: Integrate with Android APIs to open Weibo, capture data, and upload.
  }
}
