import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:sig_ubs/context/authProvider.dart';

class AuthService {
  final BuildContext context;

  AuthService(this.context);

  void authLogin(String cpf, String password) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/api/token/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': cpf, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Dados recebidos: $data');
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider.setAuth(data['refresh']);

        // Decodifique o token e extraia o que você precisa
        final decodedToken = JwtDecoder.decode(data['access']);
        // final userName = decodedToken['username'] ?? 'Unknown'; // Ajuste conforme necessário

        authProvider.setUser(decodedToken);
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
}

