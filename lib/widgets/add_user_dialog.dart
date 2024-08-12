// lib/widgets/add_user_dialog.dart
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key});

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String _role = 'user';

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Usuario'),
      content: Column(
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
          DropdownButtonFormField<String>(
            value: _role,
            items: ['master', 'admin', 'user']
                .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _role = value);
            },
            decoration: const InputDecoration(labelText: 'Rol'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            final newUser = AppUser(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              email: _emailController.text,
              password: _passwordController.text,
              role: _role,
            );
            Navigator.of(context).pop(newUser);
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}