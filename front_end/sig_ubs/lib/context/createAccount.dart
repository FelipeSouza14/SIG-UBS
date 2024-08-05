import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void createAccount(BuildContext context, String nome, String cpf, String telefone,
    String dataNascimento, String senha) async {
  try {
    final url = Uri.parse('http://127.0.0.1:8000/register/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': nome,
        'cpf': cpf,
        'numTelefone': telefone,
        'dataNascimento': dataNascimento,
        'password': senha,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print('Dados recebidos: $data');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      print('Erro no cadastro. Status code: ${response.statusCode}');
      print('Resposta: ${response.body}');
    }
  } catch (error) {
    print("Falha no cadastro do usuário: $error");
  }
}
