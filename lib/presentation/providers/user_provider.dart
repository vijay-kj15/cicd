import 'package:cicd/core/data/models/user_model.dart';
import 'package:cicd/core/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_notifier.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userListProvider =
StateNotifierProvider<UserNotifier, List<UserModel>>((ref) {
  return UserNotifier(ref.read(userRepositoryProvider));
});