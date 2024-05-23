abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

abstract mixin class Volador {
  void volar() => print('estoy volando!');
}

abstract mixin class Caminante {
  void caminar() => print('estoy caminando!');
}

abstract mixin class Nadador {
  void nadar() => print('estoy nadando!');
}


class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminante {}
class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}
class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador, Volador {}


void main() {
  
  print('Delfin');
  final flipper = Delfin();
  flipper.nadar();
  
  print('\nMurcielago');
  final batman = Murcielago();
  batman.caminar();
  batman.volar();
  
  print('\nPato');
  final namor = Pato();
  namor.caminar();
  namor.volar();
  namor.nadar();
   
}