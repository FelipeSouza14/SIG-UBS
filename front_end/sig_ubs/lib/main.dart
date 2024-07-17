import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIG UBS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 78, 146, 234)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Página Principal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  //usa em toda class StatefulWidget
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Conteúdo da página',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35.0,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 78, 146, 234),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 2.0),
        unselectedLabelStyle: const TextStyle(fontSize: 2.0),
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: _buildItemIcon(Icons.home_outlined, 0),
              backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
          BottomNavigationBarItem(
              label: "Vacinação",
              icon: _buildItemIcon(Icons.bloodtype_outlined, 1),
              backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
          BottomNavigationBarItem(
              label: "Consulta",
              icon: _buildItemIcon(Icons.medical_services_outlined, 2),
              backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
          BottomNavigationBarItem(
              label: "Avisos",
              icon: _buildItemIcon(Icons.notifications_none_outlined, 3),
              backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
          BottomNavigationBarItem(
              label: "Configuração",
              icon: _buildItemIcon(Icons.settings_outlined, 4),
              backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        ],
      ),
    );
  }

  Widget _buildItemIcon(IconData iconData, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: Matrix4.translationValues(
        0,
        _selectedIndex == index
            ? -15.0
            : 0.0, // Adjust the translation for selected item
        0,
      ),
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color.fromARGB(255, 255, 255, 255)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 32, 61, 99)
              : Colors.transparent,
          width: 5.0,
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Icon(
        iconData,
        color: _selectedIndex == index
            ? const Color.fromARGB(255, 32, 61, 99)
            : Colors.blue,
      ),
    );
  }
}