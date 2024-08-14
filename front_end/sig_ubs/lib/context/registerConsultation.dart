import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void registerConsultation(BuildContext context, String cpf, String nomePaciente, String nomeProfissional,
    String data, String hora, String atendimento) async {
  try {
    final url = Uri.parse('http://127.0.0.1:8000/consultas/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'idPaciente': cpf,
        'nomePaciente': nomePaciente,
        'nomeProfissional': nomeProfissional,
        'data': data,
        'horario': hora,
        'tipoAtendimento': atendimento
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print('Dados recebidos: $data');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      print('Erro na requisição. Status code: ${response.statusCode}');
      print('Resposta: ${response.body}');
    }
  } catch (error) {
    print("Falha no cadastro da consulta: $error");
  }
}
