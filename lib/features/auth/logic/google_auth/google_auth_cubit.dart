import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  Future<UserCredential?> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final userCredentail =
            await FirebaseAuth.instance.signInWithCredential(credential);
        emit(GoogleAuthSuccess());
        return userCredentail;
      }
    } catch (e) {
      emit(GoogleAuthFailure(errorMessage: e.toString()));
      debugPrint('error from sign in with google method: $e');
    }
    return null;
  }
}
