import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  // final User userInfo;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final SupabaseClient _supabaseClient;
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  AuthService(
    // this.userInfo,
    this._supabaseClient,
  );

  // Sign in with Google and store the user in db
  Future<void> signInWithGoogle(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return;
      _user = account;
      // Extracting User info from Google
      final googleId = account.id;
      final email = account.email;
      final name = account.displayName;
      final photoUrl = account.photoUrl;

      // Storing user data to the db
      final response = _supabaseClient.from('users').upsert({
        'id': googleId,
        'email': email,
        'name': name,
        'photo_url': photoUrl,
      });

      messenger.showSnackBar(const SnackBar(
        content: Text('Saved profile'),
      ));

      notifyListeners();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  // SignOut
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _supabaseClient.auth.signOut();
    _user = null;
    notifyListeners();
  }
}
