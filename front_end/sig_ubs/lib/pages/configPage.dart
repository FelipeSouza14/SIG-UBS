import 'package:flutter/material.dart';
import 'package:sig_ubs/context/authProvider.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove o botão de voltar
          backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        ),
        body: Container(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        authProvider.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(350, 60),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sair da Conta',
                            style: TextStyle(
                              color: Color.fromARGB(255, 32, 61, 99),
                            ),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 32, 61, 99),
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }
}
