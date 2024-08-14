// List<Map<String, String>> services = [
//   {
//     'serviceType': 'Clínico Geral',
//     'photo':
//         'https://cdn.prod.website-files.com/5fd2ba952bcd68835f2c8254/6545524c93431cb247e72cd9_Professional-14.remini-enhanced-p-500.webp',
//   },
//   {
//     'serviceType': 'Pediatria',
//     'photo':
//         'https://cdn.prod.website-files.com/5fd2ba952bcd68835f2c8254/6545521d1914f328e7a94ac6_Professional-1.remini-enhanced-p-500.webp',
//   },
//   {
//     'serviceType': 'Odontologia',
//     'photo':
//         'https://cdn.prod.website-files.com/5fd2ba952bcd68835f2c8254/654552808ea12859684a8304_Professional-7.remini-enhanced-p-500.webp',
//   },
//   {
//     'serviceType': 'Nutricionista',
//     'photo':
//         'https://cdn.prod.website-files.com/5fd2ba952bcd68835f2c8254/6545545969f23f5e26292eae_Professional-8.remini-enhanced-p-500.webp',
//   },
// ];
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// final List<String> daysOfWeek = [
//   'Seg',
//   'Ter',
//   'Qua',
//   'Qui',
//   'Sex',
//   'Sáb',
// ];

final List<String> numbersOfWeek = [
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
];

final List<String> hours = [
  '09:00',
  '10:20',
  '11:40',
  '14:00',
  '15:20',
  '16:40',
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
