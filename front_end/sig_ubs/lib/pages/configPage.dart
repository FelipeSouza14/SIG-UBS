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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.all(16.0), // Padding ao redor do botão
                    child: ElevatedButton(
                        onPressed: () {
                          authProvider.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Fundo branco
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Borda arredondada
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Sair da Conta',
                              style: TextStyle(
                                color: const Color.fromARGB(
                                    255, 32, 61, 99), // Cor do texto
                              ),
                            ),
                            const SizedBox(
                                width: 30), // Espaço entre o texto e o ícone
                            Icon(
                              Icons.logout,
                              color: const Color.fromARGB(255, 32, 61, 99),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )));
  }
}
