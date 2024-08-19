import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardVaccination.dart';
// import 'package:sig_ubs/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({super.key});

  @override
  State<VaccinationPage> createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  List vaccines = [];
  List filteredVaccines = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchVaccines();
    searchController.addListener(_filterVaccines);
  }

  Future<void> fetchVaccines() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/vacinacao/'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        vaccines = jsonDecode(response.body);
        filteredVaccines = vaccines; // Inicialmente, exibir todos os serviços
      });
    } else {
      throw Exception('Failed to load services');
    }
  }

  void _filterVaccines() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredVaccines = vaccines
          .where(
              (vaccine) => vaccine['nomeVacina'].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
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
                        'Vacinas Disponíveis',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Digite o nome da vacina',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
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
                  children: filteredVaccines.map((vaccine) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CardVaccination(
                                nomeVacina: vaccine['nomeVacina']!,
                                data: vaccine['data']!,
                                horario: vaccine['horario']!,
                                publicoAlvo: vaccine['publicoAlvo']!,
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
    );
  }
}
