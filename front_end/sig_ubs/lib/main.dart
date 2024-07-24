import 'package:flutter/material.dart';
import 'package:sig_ubs/pages/loginPage.dart';
import 'package:sig_ubs/pages/menuPage.dart';
import 'package:sig_ubs/pages/registerPage.dart';
import 'package:sig_ubs/pages/homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIG-UBS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 148, 219)),
        useMaterial3: true,
      ),
      home: const MenuPage(),
      routes: {
        '/login': (context) => const LoginPage(), 
        '/register': (context) => const RegisterPage(), 
        '/home': (context) => const HomePage(title: 'Página Principal'), 
      },
    );
  }
}

