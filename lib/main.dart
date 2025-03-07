import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strokesync/views/screens/login_screen.dart';
import 'package:strokesync/views/screens/signup_screen.dart';
import 'package:strokesync/views/screens/forgot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StrokeSyncApp());
}

class StrokeSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StrokeSync',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/home':
            (context) =>
                Scaffold(body: Center(child: Text("Home Placeholder"))),
      },
    );
  }
}
