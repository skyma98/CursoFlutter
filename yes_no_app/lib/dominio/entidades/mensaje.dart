enum DeQuien { mia, suya }

class Mensaje {
  final String texto;
  final String? imagenUrl;
  final DeQuien deQuien;

  Mensaje({required this.texto, required this.deQuien, this.imagenUrl});
}
