// lib/services/user_session_service.dart
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class UserSessionService extends ChangeNotifier {
  final List<AppUser> _connectedUsers = [];
  static const int maxUsers = 4;

  bool isConnected(AppUser user) {
    return _connectedUsers.contains(user);
  }

  List<AppUser> get connectedUsers => _connectedUsers;

  bool addUser(AppUser user) {
    if (_connectedUsers.length >= maxUsers || isConnected(user)) return false;
    _connectedUsers.add(user);
    notifyListeners();
    return true;
  }

  void removeUser(AppUser user) {
    _connectedUsers.remove(user);
    notifyListeners();
  }
}