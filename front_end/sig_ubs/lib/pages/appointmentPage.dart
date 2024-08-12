import 'package:flutter/material.dart';
import 'package:sig_ubs/components/cardService.dart';
import 'package:sig_ubs/components/navBar.dart';
import 'package:sig_ubs/utils.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int? _selectedDayIndex;
  int? _selectedHourIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 148, 219),
        title: const Text(
          'Voltar',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Define a altura como a altura total da tela
        width: MediaQuery.of(context)
            .size
            .width, // Define a largura como a largura total da tela
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Você está agendado com:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const CardService(
                        serviceType: 'Luíz Otávio\nOdontologia',
                        photo:
                            'https://cdn.prod.website-files.com/5fd2ba952bcd68835f2c8254/654552808ea12859684a8304_Professional-7.remini-enhanced-p-500.webp'),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'O melhor dia para você é:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 10.0, // Espaço entre os containers
                      runSpacing: 10.0, // Espaço entre as linhas
                      alignment: WrapAlignment.center,
                      children: List.generate(daysOfWeek.length, (index) {
                        bool isSelected = _selectedDayIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDayIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            constraints: const BoxConstraints(
                              maxWidth: 60, // Limita a largura do card
                              maxHeight: 90,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromARGB(255, 0, 148,
                                      219)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  daysOfWeek[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors
                                            .white 
                                        : const Color.fromARGB(
                                            255, 0, 148, 219),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  numbersOfWeek[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors
                                            .white 
                                        : const Color.fromARGB(
                                            255, 0, 148, 219),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'O melhor horário para você é:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 10.0, // Espaço entre os containers
                      runSpacing: 10.0, // Espaço entre as linhas
                      alignment: WrapAlignment.center,
                      children: List.generate(hours.length, (index) {
                        bool isSelected = _selectedHourIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedHourIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            constraints: const BoxConstraints(
                              maxWidth: 100, // Limita a largura do card
                              maxHeight: 60,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromARGB(255, 0, 148,
                                      219) 
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  hours[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors
                                            .white 
                                        : const Color.fromARGB(
                                            255, 0, 148, 219),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Resumo do Agendamento',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.medical_services_outlined,
                                    size: 25.0,
                                    color: Color.fromARGB(255, 225, 220, 220)),
                                SizedBox(width: 15),
                                Text(
                                  'Tipo de atendimento',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Psicológico',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range_outlined,
                                    size: 25.0,
                                    color: Color.fromARGB(255, 225, 220, 220)),
                                SizedBox(width: 15),
                                Text(
                                  'Data',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '12/08',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.alarm_outlined,
                                    size: 25.0,
                                    color: Color.fromARGB(255, 225, 220, 220)),
                                SizedBox(width: 15),
                                Text(
                                  'Horário',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 225, 220, 220),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '09:00',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 148, 219),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Ação
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(190, 40),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Ação
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 148, 219),
                            fixedSize: const Size(190, 40),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNewNavBar(),
    );
  }
}
