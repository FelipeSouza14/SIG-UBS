import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardService.dart';
import 'package:sig_ubs/components/navBar.dart';
import 'package:sig_ubs/utils.dart';

class AppointmentPage extends StatefulWidget {
  final String nome, imagem, especialidade, telefone;

  const AppointmentPage(
      {super.key,
      required this.nome,
      required this.imagem,
      required this.especialidade,
      required this.telefone});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int? _selectedDayIndex;
  int? _selectedHourIndex;

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
        height: MediaQuery.of(context).size.height,
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Você está agendado com:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CardService(
                        serviceType: '${widget.nome}\n${widget.especialidade}',
                        photo: widget.imagem),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'O melhor dia para você é:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Aqui você já tinha os dias e horas configurados
                    // ...
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Resumo do Agendamento',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.medical_services_outlined,
                                    size: 25.0,
                                    color:
                                        Color.fromARGB(255, 225, 220, 220)),
                                const SizedBox(width: 15),
                                const Text(
                                  'Tipo de atendimento',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.especialidade,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.person_outline,
                                    size: 25.0,
                                    color:
                                        Color.fromARGB(255, 225, 220, 220)),
                                SizedBox(width: 15),
                                Text(
                                  'Nome',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.nome,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.phone,
                                    size: 25.0,
                                    color:
                                        Color.fromARGB(255, 225, 220, 220)),
                                SizedBox(width: 15),
                                Text(
                                  'Telefone',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.telefone,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // Restante do código...
                  ],
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
