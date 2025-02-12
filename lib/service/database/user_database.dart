import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallpaper_app/models/user_model.dart';

class UserDatabase {
  final database = Supabase.instance.client.from('users');

  // Create of new User
  Future<void> createNewUser(UserModel user) async {
    // Check if a user with the same ID already exists
    final existingUser =
        await database.select().eq('email', user.email).maybeSingle();

    if (existingUser == null) {
      // Insert the user only if they don't already exist
      await database.insert(user.toMap());
    } else {
      print('User with ID ${user.email} already exists.');
    }
  }

  // Read User info
  Future<UserModel?> getUser(String email) async {
    final user = await database.select().eq('email', email).maybeSingle();
    if (user == null) {
      return null;
    }
    return UserModel.fromMap(user);
  }

  // Delete User
  Future deleteUser(UserModel user) async {
    await database.delete().eq('email', user.email);
  }
}
