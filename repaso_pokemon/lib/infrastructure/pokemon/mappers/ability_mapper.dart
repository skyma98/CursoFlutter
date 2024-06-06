import 'package:pokemon_prueba/domain/pokemon/abilities/ability.dart';
import 'package:pokemon_prueba/infrastructure/pokemon/datasource/model/pokemon_response.dart';

class AbilityMapper {
  static Ability convert(AbilityResponse abilityResponse) {
    return Ability(name: abilityResponse.ability.name);
  }
}
