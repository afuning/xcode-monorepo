# xcode-monorepo

This monorepo contains multiple apps:

- **apps/web**: A standard Next.js (App Router) project.
- **apps/mobile**: A Flutter project.
- **apps/android**: Android native layer for Accessibility-based Weibo automation.

## Getting started

### Next.js

```bash
cd apps/web
npm install
npm run dev
```

### Flutter

```bash
cd apps/mobile
flutter pub get
flutter run
```

## 功能描述

### Flutter（安卓端）数据抓取

Flutter 应用运行在安卓设备上，负责从每天 0 点开始每隔 20 分钟定时循环通过 Android 无障碍服务打开手机中的微博 App，抓取微博数据并提交到后台服务。

### Next.js 数据展示

Next.js 应用从后台获取抓取到的微博数据，并以图表形式展示关键指标与趋势。

## 架构概览

```
┌────────────────────────┐
│        Flutter         │
│  UI / 配置 / 可视化     │
│                        │
│  - 超话管理             │
│  - 定时策略             │
│  - 数据展示（趋势图）   │
│  - 日志                 │
└──────────┬─────────────┘
           │ MethodChannel
┌──────────▼─────────────┐
│     Android 原生层      │
│                        │
│  MainActivity           │
│   └─ MethodChannel     │
│                        │
│  AccessibilityService   │
│   ├─ 打开微博           │
│   ├─ 进入超话           │
│   ├─ 读取超Like         │
│   └─ 返回数值           │
│                        │
│  WorkManager / Service  │
│   └─ 定时执行           │
└────────────────────────┘
```
