import 'package:pokemon_prueba/domain/user/user.dart';

abstract class AUserRepository {
  Future<User> getUser();
}
