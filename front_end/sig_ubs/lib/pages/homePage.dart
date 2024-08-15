import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../context/authProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 148, 219),
          title: const Text(
            'Bem-vindo',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            if (authProvider.user.isNotEmpty)
              Text(
                '${authProvider.user['username']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              onPressed: () {
                authProvider.logout();
              },
            ),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Conteúdo da página',
              ),
            ],
          ),
        ));
  }
}
