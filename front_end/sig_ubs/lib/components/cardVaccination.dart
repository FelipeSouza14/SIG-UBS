import 'package:flutter/material.dart';

class CardVaccination extends StatelessWidget {
  const CardVaccination({
    super.key,
    required this.nomeVacina,
    required this.data,
    required this.horario,
    required this.publicoAlvo,
  });

  final String nomeVacina;
  final String data;
  final String horario;
  final String publicoAlvo;

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
            nomeVacina,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Data: $data',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Horário: $horario',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Público Alvo: $publicoAlvo',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
