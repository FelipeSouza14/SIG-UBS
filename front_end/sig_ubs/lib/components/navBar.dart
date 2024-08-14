import 'package:flutter/material.dart';

class MyNewNavBar extends StatefulWidget {
  const MyNewNavBar({super.key});

  @override
  State<MyNewNavBar> createState() => _MyNewNavBarState();
}

class _MyNewNavBarState extends State<MyNewNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegue para a página correspondente
    switch (index) {
      // case 0:
      //   Navigator.pushNamed(context, '/');
      //   break;
      case 1:
        Navigator.pushNamed(context, '/vaccination');
        break;
      case 2:
        Navigator.pushNamed(context, '/services');
        break;
      // case 3:
      //   Navigator.pushNamed(context, '/alerts');
      //   break;
      // case 4:
      //   Navigator.pushNamed(context, '/config');
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            label: "",
            icon: _buildItemIcon(Icons.bloodtype_outlined, 1),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.medical_services_outlined, 2),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.notifications_none_outlined, 3),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.settings_outlined, 4),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
      ],
    );
  }

  //Buttons animation
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