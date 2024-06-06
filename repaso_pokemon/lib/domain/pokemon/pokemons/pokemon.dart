import 'package:pokemon_prueba/domain/pokemon/abilities/ability.dart';
import 'package:pokemon_prueba/domain/pokemon/types/pokemon_type.dart';

class Pokemon {
  final String name;
  final double height;
  final double weight;
  final int id;
  final List<Ability> abilities;
  final String urlImage;
  final List<PokemonType> types;

  Pokemon({required this.name, required this.height, required this.weight, required this.id, required this.abilities, required this.urlImage, required this.types});
}
