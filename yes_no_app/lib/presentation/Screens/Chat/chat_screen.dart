import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/dominio/entidades/mensaje.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widget/chat/mensajes_de_ella_burbuja.dart';
import 'package:yes_no_app/presentation/widget/chat/mi_mensaje_burbuja.dart';
import 'package:yes_no_app/presentation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmlIykRtakf5tK78OcnEmEG5bYQiPy7JqVbA&usqp=CAU'),
            )),
        title: const Text('Roberta 🤭'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollControler,
              itemCount: chatProvider.mensajeLista.length,
              itemBuilder: (context, index) {
                final mensajes = chatProvider.mensajeLista[index];
                return (mensajes.deQuien == DeQuien.suya)
                    ? MensajesDeElla(
                        mensj: mensajes,
                      )
                    : MensajeBurbuja(mensj: mensajes);
              },
            )),
            MensajeFieldBox(
              onValue: chatProvider.sendMensaje,
            ),
          ],
        ),
      ),
    );
  }
}
