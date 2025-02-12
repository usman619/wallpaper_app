import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallpaper_app/models/user_model.dart';
import 'package:wallpaper_app/service/database/user_database.dart';
import 'package:wallpaper_app/service/user_provider.dart';
import 'package:wallpaper_app/utils/constant.dart';

class AuthService extends ChangeNotifier {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(serverClientId: serverClientId);
  final SupabaseClient _supabaseClient;
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  AuthService(this._supabaseClient);

  // Sign in with Google and store the user in db
  Future<void> signInWithGoogle(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return;
      _user = account;

      final googleAuth = await account.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      log('googleAuth: $googleAuth, accessToken: $accessToken, idToken: $idToken');

      if (accessToken == null || idToken == null) {
        return;
      }

      // Extracting User info from Google
      final userModel = UserModel(
        googleId: account.id,
        email: account.email,
        name: account.displayName ?? 'No Name',
        photoUrl: account.photoUrl ?? 'No Photo',
      );

      log('userModel: $userModel');

      // Signing in with Supabase
      final response = await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final supabaseUser = response.user;
      log('supabaseUser: $supabaseUser');
      if (supabaseUser == null) {
        return;
      }
      // Setting the data in user provider value
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userModel);

      // Storing user data to the db
      final userDatabase = UserDatabase();

      await userDatabase.createNewUser(userModel);

      messenger.showSnackBar(const SnackBar(
        content: Text('Login Successful'),
      ));

      notifyListeners();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      log('Error: ${e.toString()}');
    }
  }

  // SignOut
  Future<void> signOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await _supabaseClient.auth.signOut();

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.clearUser();
    _user = null;
    notifyListeners();
  }
}
