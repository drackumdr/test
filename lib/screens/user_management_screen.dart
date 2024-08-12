// lib/screens/user_management_screen.dart
import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../services/auth_service.dart';
import '../services/user_session_service.dart';
import '../widgets/edit_user_dialog.dart';

class UserManagementScreen extends StatefulWidget {
  final UserSessionService userSessionService;

  const UserManagementScreen({super.key, required this.userSessionService});

  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final AuthService _authService = AuthService();

  void _editUser(AppUser user) async {
    final updatedUser = await showDialog<AppUser>(
      context: context,
      builder: (context) => EditUserDialog(user: user),
    );

    if (updatedUser != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final users = _authService.users;

    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Usuarios')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.email),
            subtitle: Text(user.role),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _editUser(user),
            ),
          );
        },
      ),
    );
  }
}