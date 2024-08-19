import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sig_ubs/components/cardAppointment.dart';
import '../context/authProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardAppointment(appointmentType: "appointmentType", date: "date", hour: "hour", professional: "professional"),
              SizedBox(height: 10.0),
              CardAppointment(appointmentType: "appointmentType", date: "date", hour: "hour", professional: "professional"),
              // Text(
              //   'Conteúdo da página',
              // ),
            ],
          ),
        ));
  }
}
