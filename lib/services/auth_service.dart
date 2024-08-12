// lib/services/auth_service.dart
import '../models/app_user.dart';

class AuthService {
  static final List<AppUser> _users = [
    AppUser(id: '1', email: 'mms@mms.com', password: 'mms4321', role: 'master'),
    AppUser(id: '2', email: 'admin@mms.com', password: 'admin1234', role: 'admin'),
  ];

  AppUser? authenticate(String email, String password) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  List<AppUser> get users => _users;
}