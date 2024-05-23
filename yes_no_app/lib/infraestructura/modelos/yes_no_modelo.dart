import 'package:yes_no_app/dominio/entidades/mensaje.dart';

class YesNoModelo {
  final String answer;
  final bool forced;
  final String image;

  YesNoModelo({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModelo.fromJson(Map<String, dynamic> json) => YesNoModelo(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Mensaje toMessageEntity() => Mensaje(
      texto: answer == 'yes' ? 'Si' : 'No',
      deQuien: DeQuien.suya,
      imagenUrl: image);
}
