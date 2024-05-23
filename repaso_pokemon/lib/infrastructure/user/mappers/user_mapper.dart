import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/infrastructure/user/datasource/model/user_response.dart';

class UserMapper {
  static User convert(UserResult userResult) {
    return User(
        name: userResult.name.first,
        lastName: userResult.name.last,
        email: userResult.email,
        imageUrl: userResult.picture.large,
        uuid: userResult.login.uuid);
  }
}
