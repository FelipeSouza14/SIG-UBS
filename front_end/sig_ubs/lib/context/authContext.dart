import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:sig_ubs/context/authProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final BuildContext context;
  Timer? _timer;

  AuthService(this.context) {
    startTokenUpdate();
  }

  // Essa função garente que o updateToken() seja chamada a cada 4 minutos 
  void startTokenUpdate() {
    const duration = Duration(minutes: 4);
    _timer = Timer.periodic(duration, (timer) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.authToken != null) {
        updateToken();
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }

  // Função de login -> Essa função faz o login e salva os tokens de autenticação
  void authLogin(String cpf, String password) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      final url = Uri.parse('http://127.0.0.1:8000/api/token/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'cpf': cpf, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Dados recebidos: $data');
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider.setAuth(data['refresh']);

        // Decodifique o token e extraia o que você precisa
        final decodedToken = JwtDecoder.decode(data['access']);
        authProvider.setUser(decodedToken);

        String jsonString = jsonEncode(data);
        await localStorage.setString('authTokens', jsonString);

        print(authProvider.user);
        print(authProvider.authToken);

        if (decodedToken != {}) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        print('Erro na requisição. Status code: ${response.statusCode}');
        print('Resposta: ${response.body}');
      }
    } catch (error) {
      print("Falha na requisição do usuário: $error");
    }
  }

  // Função de atualizar token -> Essa função atualiza o token para que o usuário não perca o acesso ao sistema
  void updateToken() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final url = Uri.parse('http://127.0.0.1:8000/api/token/refresh/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh': authProvider.authToken}),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Dados recebidos: $data');
        authProvider.setAuth(data['refresh']);

        // Decodifique o token e extraia o que você precisa
        final decodedToken = JwtDecoder.decode(data['access']);
        authProvider.setUser(decodedToken);

        String jsonString = jsonEncode(data);
        await localStorage.setString('authTokens', jsonString);
      } else {
        authProvider.logout;
        print('Erro na requisição. Status code: ${response.statusCode}');
        print('Resposta: ${response.body}');
      }
    } catch (error) {
      print("Falha na requisição do updateToken: $error");
    }
  }
}