import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_register_state.dart';

class EmailRegisterCubit extends Cubit<EmailRegisterState> {
  EmailRegisterCubit() : super(EmailRegisterInitial());

  bool isLoading = false;
  Future<void> emailRegister(
      {required String email, required String password}) async {
    emit(EmailRegisterLoading(isLoading: true));
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        emit(EmailRegisterSuccess());
        await Future.delayed(const Duration(seconds: 2));
        emit(EmailRegisterLoading(isLoading: false));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(EmailRegisterFailure(errorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(EmailRegisterFailure(errorMessage: 'email-already-in-use'));
      }
      emit(EmailRegisterLoading(isLoading: false));
    } catch (e) {
      emit(EmailRegisterFailure(errorMessage: e.toString()));
      emit(EmailRegisterLoading(isLoading: false));
      debugPrint('error from email register method: $e');
    }
  }
}
