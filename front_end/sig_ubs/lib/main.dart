import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sig_ubs/pages/servicesPage.dart';
import 'context/authProvider.dart';
import 'pages/loginPage.dart';
import 'pages/menuPage.dart';
import 'pages/registerPage.dart';
import 'pages/homePage.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var name = authProvider.user['username'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIG UBS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 148, 219),
        ),
        useMaterial3: true,
      ),
      home: _buildHome(authProvider),
      routes: {
        '/menu': (context) => const MenuPage(),
        '/home': (context) => const HomePage(title: 'Bem-vindo'),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/services': (context) => const ServicesPage(),
      },
    );
  }

  Widget _buildHome(AuthProvider authProvider) {
    if (authProvider.authToken != null && authProvider.authToken.isNotEmpty) {
      return const HomePage(title: 'Bem-vindo');
    } else {
      return const MenuPage();
    }
  }
}


