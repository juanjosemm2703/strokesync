import 'package:flutter/material.dart';
import 'package:strokesync/controllers/auth_controller.dart';
import 'package:strokesync/views/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedRole;
  bool _isLoading = false;

  void _signup() async {
    setState(() => _isLoading = true);
    String? error = await _authController.signup(
      _emailController.text,
      _passwordController.text,
      _confirmPasswordController.text,
      _nameController.text,
      _selectedRole ?? '',
    );
    setState(() => _isLoading = false);
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 32, color: Colors.blue),
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: "Name",
                icon: Icons.person,
                controller: _nameController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: "Email",
                icon: Icons.email,
                controller: _emailController,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Role",
                  border: OutlineInputBorder(),
                ),
                items:
                    ['Paramedic', 'Nurse', 'Medic', 'Neurologist']
                        .map(
                          (role) =>
                              DropdownMenuItem(value: role, child: Text(role)),
                        )
                        .toList(),
                onChanged: (value) => setState(() => _selectedRole = value),
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: "Password",
                icon: Icons.lock,
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: "Confirm Password",
                icon: Icons.lock,
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: _signup,
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
