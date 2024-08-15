  final List<Map<String, String>> vaccines = [
    {
      'nomeVacina': 'COVID-19',
      'data': '15/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Adultos'
    },
    {
      'nomeVacina': 'Gripe',
      'data': '20/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Crianças de 0 à 5 anos'
    },
    {
      'nomeVacina': 'Febre amarela',
      'data': '22/08/2024',
      'horario': '08:00 às 12:00',
      'publicoAlvo': 'Adultos'
    },
  ];

final List<String> hours = [
  '09:00',
  '10:00',
  '11:00',
  '14:00',
  '15:00'
]; // Exemplo de lista de horas

final List<String> numbersOfWeek = [
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
];

// Pega a data dos dias da semana atual
Future<List<Map<String, String>>> getCurrentWeekDays() async {
  final now = DateTime.now();
  final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final days = List.generate(6, (index) {
    final day = firstDayOfWeek.add(Duration(days: index));
    return {
      'dayName': getDayName(day.weekday),
      'dayNumber': day.day.toString().padLeft(2, '0')
    };
  });
  return days;
}

// Nomes dos dias
String getDayName(int weekday) {
  const names = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'];
  return names[weekday - 1];
}
