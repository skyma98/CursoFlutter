import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_respuesta.dart';
import 'package:yes_no_app/dominio/entidades/mensaje.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollControler = ScrollController();
  final GetYesNoRespuesta getYesNoRespuesta = GetYesNoRespuesta();
  List<Mensaje> mensajeLista = [
    Mensaje(texto: 'Hola bb!', deQuien: DeQuien.mia),
    Mensaje(texto: 'Ya regresaste del trabajo?', deQuien: DeQuien.mia),
  ];

  Future<void> sendMensaje(String texto) async {
    if (texto.isEmpty) return;
    final nuevoMensaje = Mensaje(texto: texto, deQuien: DeQuien.mia);
    mensajeLista.add(nuevoMensaje);
    notifyListeners();
    moveScrollToBottom();

    if (texto.endsWith('?')) {
      await suRespuesta();
    }
  }

  Future<void> suRespuesta() async {
    final suMensaje = await getYesNoRespuesta.getRespuesta();
    mensajeLista.add(suMensaje);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollControler.animateTo(chatScrollControler.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
