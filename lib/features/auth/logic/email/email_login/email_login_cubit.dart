import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_login_state.dart';

class EmailLoginCubit extends Cubit<EmailLoginState> {
  EmailLoginCubit() : super(EmailLoginInitial());

  bool isLoading = false;
  Future<void> emailLogin(
      {required String email, required String password}) async {
    emit(EmailLoginLoading(isLoading: true));
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        emit(EmailLoginSuccess());
        emit(EmailLoginLoading(isLoading: false));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(EmailLoginFailure(errorMessage: 'invalid-credential'));
      }
      emit(EmailLoginLoading(isLoading: false));
    } catch (e) {
      emit(EmailLoginFailure(errorMessage: e.toString()));
      debugPrint('error from email login method: $e');
      emit(EmailLoginLoading(isLoading: false));
    }
  }
}
