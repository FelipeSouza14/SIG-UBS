import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardVaccination.dart';
import 'package:sig_ubs/components/navBar.dart';

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({super.key});

  @override
  State<VaccinationPage> createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  final List<Map<String, String>> vaccines = [
    {
      'nomeVacina': 'COVID-19',
      'data': '15/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Adultos'
    },
    {
      'nomeVacina': 'Gripe',
      'data': '20/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Crianças de 0 à 5 anos'
    },
    {
      'nomeVacina': 'Febre amarela',
      'data': '22/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Adultos'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vacinas Disponíveis',
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: vaccines.map((vaccine) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/appointment');
                                },
                                child: CardVaccination(
                                  nomeVacina: vaccine['nomeVacina']!,
                                  data: vaccine['data']!,
                                  horario: vaccine['horario']!,
                                  publicoAlvo: vaccine['publicoAlvo']!,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25)
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNewNavBar(),
    );
  }
}
