# Android Native Layer

This module hosts the Android native implementation used by the Flutter app.

## Responsibilities

- Implement an `AccessibilityService` that opens Weibo and navigates to the target Super Topics.
- Parse the "Super Like" count from the UI tree and return it to Flutter via `MethodChannel`.
- Report success/failure reliably back to Flutter for each run.
- Provide scheduled execution using `WorkManager` or a foreground/background `Service`.

## Integration

Flutter communicates with this module through a `MethodChannel` named `weibo_capture`.

Expected native handlers:
- `openWeibo`
- `readSuperLikeCount`
- `openWeiboAndEnterTopic`
- `reportCaptureStatus`
