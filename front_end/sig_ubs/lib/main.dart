import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sig_ubs/pages/navScreen.dart';
import 'context/authProvider.dart';
import 'pages/loginPage.dart';
import 'pages/menuPage.dart';
import 'pages/registerPage.dart';

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
        '/home': (context) => const NavScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }

  Widget _buildHome(AuthProvider authProvider) {
    if (authProvider.authToken.isNotEmpty) {
      return const NavScreen();
    } else {
      return const MenuPage();
    }
  }
}
