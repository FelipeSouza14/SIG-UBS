import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardService.dart';
import 'package:sig_ubs/components/navBar.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
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
        height: MediaQuery.of(context).size.height, // Define a altura como a altura total da tela
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
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Escolha o tipo de atendimento:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
              
              // Cards
              CardService(serviceType: 'Clínico Geral', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.steveglassphotographer.com%2Fprofessional-headshots-atlanta-steve-glass%2Fwaist-up-executive-portrait&psig=AOvVaw1ixHhOOryMW9r-3W6Rk-mh&ust=1723338873285000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCODstd6f6YcDFQAAAAAdAAAAABAD'),
              // CardService(),
              // CardService(),
              // CardService(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNewNavBar(),
    );
  }
}
