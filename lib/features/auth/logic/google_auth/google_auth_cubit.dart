import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  User user = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;
  Future<UserCredential?> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        user = userCredential.user!;
        isLoading = true;
        emit(GoogleAuthSuccess(user: user, isLoading: isLoading));
        Future.delayed(const Duration(seconds: 2), () {
          isLoading = false;
        emit(GoogleAuthSuccess(user: user, isLoading: isLoading));
        });
        return userCredential;
      }
    } catch (e) {
      isLoading = false;
      emit(GoogleAuthFailure(errorMessage: e.toString()));
      debugPrint('error from sign in with google method: $e');
    }
    return null;
  }
}
