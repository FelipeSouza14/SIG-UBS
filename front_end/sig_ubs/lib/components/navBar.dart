import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  void load(int index) {
    pageIndexNotifier.value = index;
  }
}

final dataService = DataService();

class NewNavBar extends HookWidget {
  const NewNavBar({super.key, this.itemSelectedCallback});

  final void Function(int)? itemSelectedCallback;

  @override
  Widget build(BuildContext context) {
    var state = useState(0);
    return BottomNavigationBar(
      iconSize: 35.0,
      onTap: (index) {
        state.value = index;
        itemSelectedCallback?.call(index);
      },
      currentIndex: state.value,
      selectedItemColor: const Color.fromARGB(255, 78, 146, 234),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontSize: 2.0),
      unselectedLabelStyle: const TextStyle(fontSize: 2.0),
      items: [
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.home_outlined, 0, state),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.bloodtype_outlined, 1, state),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.medical_services_outlined, 2, state),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.notifications_none_outlined, 3, state),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
        BottomNavigationBarItem(
            label: "",
            icon: _buildItemIcon(Icons.settings_outlined, 4, state),
            backgroundColor: const Color.fromARGB(255, 32, 61, 99)),
      ],
    );
  }

  //Animação dos botões
  Widget _buildItemIcon(
    IconData iconData,
    int index,
    ValueNotifier<int> state,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: Matrix4.translationValues(
        0,
        state.value == index
            ? -15.0
            : 0.0, // Adjust the translation for selected item
        0,
      ),
      decoration: BoxDecoration(
        color: state.value == index
            ? const Color.fromARGB(255, 255, 255, 255)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: state.value == index
              ? const Color.fromARGB(255, 32, 61, 99)
              : Colors.transparent,
          width: 5.0,
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Icon(
        iconData,
        color: state.value == index
            ? const Color.fromARGB(255, 32, 61, 99)
            : Colors.blue,
      ),
    );
  }
}
