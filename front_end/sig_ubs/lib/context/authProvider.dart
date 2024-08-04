import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Essa classe gerencia os estados
class AuthProvider with ChangeNotifier {
  late String _authToken = ''; // Esse é o estado para o token de atualização
  Map<String, dynamic> _user = {}; // Esse é o estado para a decodificação do token de acesso, que seria um objeto JSON, por isso as {}

  String get authToken => _authToken;
  Map<String, dynamic> get user => _user;

  AuthProvider() {
    _loadAuthData();
  }

  Future<void> _loadAuthData() async {
    final prefs = await SharedPreferences.getInstance(); // Essa função busca os dados salvos no armazenamento local(histórico)
    final token = prefs.getString('refresh');
    final user = prefs.getString('access');

    if (token != null) {
      _authToken = token;
    }
    if (user != null) {
      _user = Map<String, dynamic>.from(jsonDecode(user));
    }
    notifyListeners();
  }

  Future<void> setAuth(String token) async {
    _authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh', token);
    notifyListeners();
  }

  Future<void> setUser(Map<String, dynamic> user) async {
    _user = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access', jsonEncode(user));
    notifyListeners();
  }

  Future<void> logout() async {
    _authToken = '';
    _user = {};
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh');
    await prefs.remove('access');
    notifyListeners();
  }
}
