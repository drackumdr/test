// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/user_session_service.dart';
import '../models/app_user.dart';
import 'user_management_screen.dart';

class LoginScreen extends StatefulWidget {
  final UserSessionService userSessionService;

  const LoginScreen({super.key, required this.userSessionService});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    AppUser? user = _authService.authenticate(email, password);
    if (user != null) {
      bool added = widget.userSessionService.addUser(user);
      if (added) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => UserManagementScreen(
              userSessionService: widget.userSessionService,
            ),
          ),
        );
      } else {
        setState(() {
          _errorMessage = 'Número máximo de usuarios conectados alcanzado.';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Credenciales incorrectas.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}