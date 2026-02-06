import 'package:flutter/services.dart';

class AndroidBridge {
  AndroidBridge({MethodChannel? channel})
      : _channel = channel ?? const MethodChannel('weibo_capture');

  final MethodChannel _channel;

  Future<void> openWeibo() async {
    await _channel.invokeMethod<void>('openWeibo');
  }

  Future<void> openWeiboAndEnterTopic({required String topicName}) async {
    await _channel.invokeMethod<void>('openWeiboAndEnterTopic', {
      'topicName': topicName,
    });
  }

  Future<String?> readSuperLikeCount() async {
    return _channel.invokeMethod<String>('readSuperLikeCount');
  }

  Future<void> reportCaptureStatus({
    required bool success,
    String? message,
  }) async {
    await _channel.invokeMethod<void>('reportCaptureStatus', {
      'success': success,
      'message': message,
    });
  }
}
