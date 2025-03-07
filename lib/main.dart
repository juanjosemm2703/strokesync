import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StrokeSyncApp());
}

class StrokeSyncApp extends StatelessWidget {
  const StrokeSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StrokeSync',
      home: Scaffold(body: Center(child: Text("Welcome to StrokeSync"))),
    );
  }
}
