import 'package:strokesync/services/firebase_service.dart';

class AuthController {
  final FirebaseService _firebaseService = FirebaseService();

  Future<String?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return "Please fill all fields";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return "Invalid email format";
    }
    try {
      await _firebaseService.signIn(email, password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signup(
    String email,
    String password,
    String confirmPassword,
    String name,
    String role,
  ) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty || role.isEmpty) {
      return "Please fill all fields";
    }
    if (password != confirmPassword) return "Passwords do not match";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return "Invalid email format";
    }
    try {
      await _firebaseService.signUp(email, password, name, role);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> resetPassword(String email) async {
    if (email.isEmpty) return "Please enter an email";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return "Invalid email format";
    }
    try {
      await _firebaseService.resetPassword(email);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
