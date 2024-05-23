import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/infrastructure/user/datasource/a_user_datasource.dart';
import 'package:pokemon_prueba/infrastructure/user/datasource/model/user_response.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_prueba/infrastructure/user/mappers/user_mapper.dart';

class UserDatasource implements AUserDatasource {
  @override
  Future<User> getUser() async {
    final dio = Dio();

    final result = await dio.get('https://randomuser.me/api/');

    if (result.statusCode! < 200 || result.statusCode! >= 300) {
      throw UnimplementedError();
    }

    final data = result.data;
    final userResponse = UserResponse.fromJson(data);
    return UserMapper.convert(userResponse.results[0]);
  }
}
