import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardService.dart';
import 'package:sig_ubs/components/navBar.dart';
import 'package:sig_ubs/pages/appointmentPage.dart';
import 'package:sig_ubs/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  List services = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  Future<void> fetchServices() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/profissionais/'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        services = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load services');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        title: const Text(
          'Voltar',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Define a altura como a altura total da tela
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
                        'Agendar consulta? \nEscolha o tipo de atendimento:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Barra de pesquisa',
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
              Column(
                children: services.map((service) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, '/appointment');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppointmentPage(
                                        nome: service["nome"],
                                        imagem: service["imagem"],
                                        especialidade: service["especialidade"],
                                        telefone: service["numTelefone"]
                                      )));
                        },
                        child: CardService(
                          serviceType: service['especialidade']!,
                          photo: service['imagem']!,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNewNavBar(),
    );
  }
}
