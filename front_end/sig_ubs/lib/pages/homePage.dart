import 'package:flutter/material.dart';
import 'package:sig_ubs/components/navBar.dart';
import '../context/authProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Adicionar o listener
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.addListener(() {
        if (authProvider.authToken.isEmpty) {
          Navigator.pushReplacementNamed(context, '/menu');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        title: Text(widget.title),
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
      ),
      bottomNavigationBar: const MyNewNavBar(),
    );
  }
}


