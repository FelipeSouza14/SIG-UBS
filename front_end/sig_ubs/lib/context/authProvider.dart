import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late String _authToken = '';
  Map<String, dynamic> _user = {};

  String get authToken => _authToken;
  Map<String, dynamic> get user => _user;
  
  void setAuth(String token) {
    _authToken = token;
    notifyListeners(); // Notifique os ouvintes sobre a alteração
  }

  void setUser(Map<String, dynamic> user) {
    _user = user;
    notifyListeners(); // Notifique os ouvintes sobre a alteração
  }

  void logout() {
    _authToken = '';
    _user = {};
    notifyListeners(); // Notifique os ouvintes sobre a alteração
  }
}
