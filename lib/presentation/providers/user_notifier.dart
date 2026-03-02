import 'package:cicd/core/data/models/user_model.dart';
import 'package:cicd/core/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserNotifier extends StateNotifier<List<UserModel>> {
  final UserRepository repository;

  UserNotifier(this.repository) : super([]);

  Future<void> loadUsers() async {
    state = await repository.getUsers();
  }

  Future<void> addUser(String name, String email) async {
    final newUser = UserModel(name: name, email: email);
    await repository.createUser(newUser);
    await loadUsers();
  }

  Future<void> deleteUser(int id) async {
    await repository.deleteUser(id);
    await loadUsers();
  }

  Future<void> updateUser(UserModel user) async {
    await repository.updateUser(user);
    await loadUsers();
  }
}