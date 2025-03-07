import 'package:flutter/material.dart';
import 'package:strokesync/controllers/auth_controller.dart';
import 'package:strokesync/views/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    String? error = await _authController.login(
      _emailController.text,
      _passwordController.text,
    );
    setState(() => _isLoading = false);
    if (error != null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "StrokeSync",
              style: TextStyle(fontSize: 32, color: Colors.blue),
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Email",
              icon: Icons.email,
              controller: _emailController,
            ),
            SizedBox(height: 10),
            CustomTextField(
              label: "Password",
              icon: Icons.lock,
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Login"),
                ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/forgot_password'),
              child: Text("Forgot Password?"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text("Don’t have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
