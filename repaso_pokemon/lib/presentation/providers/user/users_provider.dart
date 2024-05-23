import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/presentation/providers/repositories/user_repository_provider.dart';

final usersProvider = StateNotifierProvider<UserNotifier, Map<String, User>>(
  (ref) {
    final repository = ref.read(userRepositoryProvider);

    return UserNotifier(getUser: repository.getUser);
  },
);

typedef GetUserCallBack = Future<User> Function();

class UserNotifier extends StateNotifier<Map<String, User>> {
  final GetUserCallBack getUser;

  UserNotifier({required this.getUser}) : super({});

  Future<User> addUser() async {
    final usuario = await getUser();

    state = {...state, usuario.uuid: usuario};

    return usuario;
  }

  User getById(String uuid) {
    return state[uuid]!;
  }
}
