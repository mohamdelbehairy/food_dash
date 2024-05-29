import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_settings_state.dart';

class AuthSettingsCubit extends Cubit<AuthSettingsState> {
  AuthSettingsCubit() : super(AuthSettingsInitial());

  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(SendEmailVerificationSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from send email verification: $e');
    }
  }
}
