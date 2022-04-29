import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      if (currentUser != null) {
        if (!currentUser!.emailVerified) {
          await currentUser!.sendEmailVerification();
        }
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (err) {
      rethrow;
    }
  }

  bool get isLogin => _auth.currentUser != null;

  bool? get isEmailVerified => _auth.currentUser?.emailVerified;
  User? get currentUser => _auth.currentUser;

  Future<void> reload() async {
    if (currentUser != null) {
      await currentUser!.reload();
    }
  }

  Future<void> signOut() async {
    if (isLogin) {
      try {
        await _auth.signOut();
      } catch (_) {}
    }
  }
}