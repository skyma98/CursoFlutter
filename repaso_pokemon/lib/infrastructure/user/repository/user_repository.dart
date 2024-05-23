import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/infrastructure/user/datasource/a_user_datasource.dart';
import 'package:pokemon_prueba/infrastructure/user/repository/a_user_repository.dart';

class UserRepository implements AUserRepository {
  final AUserDatasource userDatasource;

  UserRepository({
    required this.userDatasource,
  });

  @override
  Future<User> getUser() {
    return userDatasource.getUser();
  }
}
