import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

// tentar tirar o future, caso não dê certo
Future<void> authLogin(String cpf, String password) async {
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
            // funcSetAuth(data['refresh']);
            // funSetUser(JwtDecoder.decode(data['access']));
        } else {
            print('Erro na requisição. Status code: ${response.statusCode}');
            print('Resposta: ${response.body}');
        }
    } catch (error) {
        print("Falha na requisição do usuário: $error");
    }
}

