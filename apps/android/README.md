# Android Native Layer

This module hosts the Android native implementation used by the Flutter app.

## Responsibilities

- Implement an `AccessibilityService` that opens Weibo and navigates to the target Super Topics.
- Read data such as Super Like counts and return results to Flutter via `MethodChannel`.
- Provide scheduled execution using `WorkManager` or a foreground/background `Service`.

## Integration

Flutter communicates with this module through a `MethodChannel` named `weibo_capture`.

Expected native handlers:
- `openWeibo`
- `readSuperLikeCount`
