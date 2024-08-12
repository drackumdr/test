// lib/models/app_user.dart
class AppUser {
  final String id;
  final String email;
  final String password;
  final String role;

  AppUser({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
  });

  AppUser copyWith({String? id, String? email, String? password, String? role}) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }
}