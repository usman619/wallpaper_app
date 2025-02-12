import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/user_model.dart';
import 'package:wallpaper_app/service/database/user_database.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  final UserDatabase _database = UserDatabase();

  UserModel? get user => _user;

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<UserModel> getSignedInUser(String email) async {
    final user = await _database.getUser(email);
    return user!;
  }

  Future<void> deleteUser() async {
    if (_user != null) {
      await _database.deleteUser(_user!);
      clearUser();
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
