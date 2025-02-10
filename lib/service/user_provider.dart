import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/user_model.dart';
import 'package:wallpaper_app/service/database/user_database.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserDatabase? _database;

  UserModel? get user => _user;

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> deleteUser() async {
    if (_user != null) {
      await _database!.deleteUser(_user!);
      clearUser();
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
