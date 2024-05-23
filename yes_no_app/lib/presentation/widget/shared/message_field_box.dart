import 'package:flutter/material.dart';

class MensajeFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MensajeFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textControll = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;
    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: (const BorderSide(color: Colors.transparent)),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Terminar tu mensaje con un "?"',
      enabledBorder: OutlineInputBorder,
      focusedBorder: OutlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textControll.value.text;
          textControll.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textControll.clear();
        focusNode.requestFocus();
      },
    );
  }
}
