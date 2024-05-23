import 'package:dio/dio.dart';
import 'package:yes_no_app/dominio/entidades/mensaje.dart';
import 'package:yes_no_app/infraestructura/modelos/yes_no_modelo.dart';

class GetYesNoRespuesta {
  final _dio = Dio();

  Future<Mensaje> getRespuesta() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModelo.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
