import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            'This Flutter app periodically opens Weibo to capture data and '
            'uploads it to the backend.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
