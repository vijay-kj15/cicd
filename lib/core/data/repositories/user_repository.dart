import 'package:cicd/core/data/datasources/database_helper.dart';
import 'package:cicd/core/data/models/user_model.dart';

class UserRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<int> createUser(UserModel user) async {
    final db = await dbHelper.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<UserModel>> getUsers() async {
    final db = await dbHelper.database;
    final result = await db.query('users');
    return result.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> updateUser(UserModel user) async {
    final db = await dbHelper.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}