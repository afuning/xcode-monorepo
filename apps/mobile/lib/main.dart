import 'package:flutter/material.dart';

import 'weibo_capture_service.dart';

void main() {
  runApp(const MonorepoApp());
}

class MonorepoApp extends StatelessWidget {
  const MonorepoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monorepo Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WeiboCaptureService _captureService;

  @override
  void initState() {
    super.initState();
    _captureService = WeiboCaptureService(
      interval: const Duration(minutes: 15),
    )..start();
  }

  @override
  void dispose() {
    _captureService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'This Flutter app periodically opens Weibo, captures data, and '
            'uploads it to the backend on a schedule.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
