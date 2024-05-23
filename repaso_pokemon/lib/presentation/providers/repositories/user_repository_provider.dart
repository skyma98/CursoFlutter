import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/infrastructure/user/datasource/user_datasource.dart';
import 'package:pokemon_prueba/infrastructure/user/repository/user_repository.dart';

final userRepositoryProvider = Provider(
  (ref) {
    return UserRepository(userDatasource: UserDatasource());
  },
);
