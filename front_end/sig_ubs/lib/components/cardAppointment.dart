import 'package:flutter/material.dart';

class CardAppointment extends StatefulWidget {
  const CardAppointment(
      {super.key,
      required this.appointmentType,
      required this.date,
      required this.hour,
      required this.professional});

  final String appointmentType;
  final String date;
  final String hour;
  final String professional;

  @override
  State<CardAppointment> createState() => _CardAppointmentState();
}

class _CardAppointmentState extends State<CardAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.appointmentType,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Data: ${widget.date}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Horário: ${widget.hour}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Profissional: ${widget.professional}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
