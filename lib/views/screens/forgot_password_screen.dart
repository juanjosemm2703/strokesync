import 'package:flutter/material.dart';
import 'package:strokesync/controllers/auth_controller.dart';
import 'package:strokesync/views/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() async {
    setState(() => _isLoading = true);
    String? error = await _authController.resetPassword(_emailController.text);
    setState(() => _isLoading = false);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Reset link sent!")));
      Navigator.pop(context);
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
              "Reset Password",
              style: TextStyle(fontSize: 32, color: Colors.blue),
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Email",
              icon: Icons.email,
              controller: _emailController,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text("Send Reset Link"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
