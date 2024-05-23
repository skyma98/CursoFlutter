import 'package:pokemon_prueba/domain/user/user.dart';

abstract class AUserDatasource {
  Future<User> getUser();
}
