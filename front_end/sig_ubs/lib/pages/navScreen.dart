import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sig_ubs/components/navBar.dart';
import 'package:sig_ubs/pages/homePage.dart';
import 'package:sig_ubs/pages/servicesPage.dart';
import 'package:sig_ubs/pages/vaccinationPage.dart';
import '../context/authProvider.dart';
import 'package:provider/provider.dart';

class NavScreen extends HookWidget {
  const NavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final pageIndex = useListenable(dataService.pageIndexNotifier).value;

    useEffect(() {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      void authListener() {
        if (authProvider.authToken.isEmpty) {
          Navigator.pushReplacementNamed(context, '/menu');
        }
      }

      // Adiciona o listener
      authProvider.addListener(authListener);

      // Remove o listener quando o widget for destruído
      return () => authProvider.removeListener(authListener);
    }, []);

    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomePage(),
          VaccinationPage(),
          ServicesPage(),
        ],
      ),
      bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.load),
    );
  }
}
