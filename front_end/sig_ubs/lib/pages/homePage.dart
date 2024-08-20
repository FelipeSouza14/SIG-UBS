import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sig_ubs/components/cardAlerts.dart';
import 'package:sig_ubs/components/cardAppointment.dart';
import '../context/authProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends HookWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final consultation = useState<List>([]);

    useEffect(() {
      Future<void> fetchConsultations() async {
        final response = await http.get(
          Uri.parse('http://127.0.0.1:8000/consultas/'),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          consultation.value = jsonDecode(response.body);
        } else {
          throw Exception('Failed to load consultations');
        }
      }

      fetchConsultations();

      return null; // Para evitar retornos inválidos
    }, []);

    final filterConsultation = consultation.value.where(
        (consults) => consults['idPaciente'] == authProvider.user['cpf']);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove o botão de voltar
          backgroundColor: const Color.fromARGB(255, 0, 148, 219),
          title: const Text(
            'Bem-vindo',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            if (authProvider.user.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(
                    18.0), // Adiciona padding de 8 pixels em todas as direções
                child: Text(
                  'Olá, ${authProvider.user['username']}!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        body: Container(
            height: MediaQuery.of(context)
                .size
                .height, // Define a altura como a altura total da tela
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 0, 148, 219),
                  Color.fromARGB(255, 52, 98, 159),
                ],
              ),
            ),
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                    child: Column(
                      children: filterConsultation.isEmpty
                          ? [
                              const CardAlerts(
                                titulo:
                                    'Não há consultas cadastradas para você!',
                                descricao:
                                    'Fique a vontade para cadastrar uma consulta quando precisar',
                              )
                            ]
                          : filterConsultation.map((consult) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CardAppointment(
                                            appointmentType:
                                                consult['tipoAtendimento'],
                                            date: consult['data'],
                                            hour: consult['horario'],
                                            professional:
                                                consult['nomeProfissional']),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              );
                            }).toList(),
                    ),
                  ),
                ],
              ),
            ))));
  }
}
