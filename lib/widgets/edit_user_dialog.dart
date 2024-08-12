// lib/widgets/edit_user_dialog.dart
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class EditUserDialog extends StatefulWidget {
  final AppUser user;

  const EditUserDialog({super.key, required this.user});

  @override
  _EditUserDialogState createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late String _role;

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.user.email);
    _passwordController = TextEditingController(text: widget.user.password);
    _role = widget.user.role;
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
      title: const Text('Editar Usuario'),
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
            final updatedUser = widget.user.copyWith(
              email: _emailController.text,
              password: _passwordController.text,
              role: _role,
            );
            Navigator.of(context).pop(updatedUser);
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
