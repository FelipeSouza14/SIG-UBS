import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardAlerts.dart';
// import 'package:sig_ubs/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  List alerts = [];
  String today = DateFormat('dd/MM/yy').format(DateTime.now()); // Data atual

  @override
  void initState() {
    super.initState();
    fetchAlerts();
  }

  Future<void> fetchAlerts() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/avisos/'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List fetchedAlerts = jsonDecode(response.body);

      // Filtrar avisos pela data atual
      setState(() {
        alerts = fetchedAlerts.where((alert) {
          try {
            // Converte 'dataEnvio' para o formato de data para comparação
            DateTime alertDate =
                DateFormat('dd/MM/yy').parse(alert['dataEnvio']);
            String alertDateFormatted =
                DateFormat('dd/MM/yy').format(alertDate);

            // Compara a data do aviso com a data atual
            return alertDateFormatted == today;
          } catch (e) {
            // Em caso de erro na conversão, não exibe o aviso
            return false;
          }
        }).toList();
      });
    } else {
      throw Exception('Failed to load alerts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Avisos Importantes do Dia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: alerts.isEmpty
                      ? [
                          CardAlerts(
                            titulo: 'Não há avisos cadastrados para hoje!',
                            descricao:
                                'Aguarde até que um novo aviso seja cadastrado.',
                          )
                        ]
                      : alerts.map((alert) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CardAlerts(
                                      titulo: alert['titulo']!,
                                      descricao: alert['descricao']!,
                                    ),
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
        ),
      ),
    );
  }
}
