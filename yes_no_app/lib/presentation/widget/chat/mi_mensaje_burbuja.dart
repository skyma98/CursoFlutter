import 'package:flutter/material.dart';
import 'package:yes_no_app/dominio/entidades/mensaje.dart';

class MensajeBurbuja extends StatelessWidget {
  final Mensaje mensj;

  const MensajeBurbuja({super.key, required this.mensj});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              mensj.texto,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
