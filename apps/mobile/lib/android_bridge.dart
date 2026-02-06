import 'package:flutter/services.dart';

class AndroidBridge {
  AndroidBridge({MethodChannel? channel})
      : _channel = channel ?? const MethodChannel('weibo_capture');

  final MethodChannel _channel;

  Future<void> openWeibo() async {
    await _channel.invokeMethod<void>('openWeibo');
  }

  Future<String?> readSuperLikeCount() async {
    return _channel.invokeMethod<String>('readSuperLikeCount');
  }
}
