import 'package:flutter/material.dart';
import 'package:yes_no_app/dominio/entidades/mensaje.dart';

class MensajesDeElla extends StatelessWidget {
  const MensajesDeElla({super.key, required this.mensj});

  final Mensaje mensj;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              mensj.texto,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImagenBurbuja(mensj.imagenUrl!),
      ],
    );
  }
}

class _ImagenBurbuja extends StatelessWidget {
  final String imageUrl;

  const _ImagenBurbuja(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print("${size.width}, ${size.height}");

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, coclp) {
          if (coclp == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Roberta escribe'),
          );
        },
      ),
    );
  }
}
