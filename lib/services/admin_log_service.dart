// lib/services/admin_log_service.dart
class AdminLogService {
  final List<String> _logs = [];

  void addLog(String log) {
    _logs.add(log);
  }

  List<String> get logs => _logs;
}