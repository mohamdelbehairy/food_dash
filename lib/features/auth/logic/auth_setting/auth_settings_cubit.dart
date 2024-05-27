import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/constants.dart';

part 'auth_settings_state.dart';

class AuthSettingsCubit extends Cubit<AuthSettingsState> {
  AuthSettingsCubit() : super(AuthSettingsInitial());

  Future<void> sendEmailVerification() async {
    try {
      await Constants.currentUser.sendEmailVerification();
      emit(SendEmailVerificationSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from send email verification: $e');
    }
  }
}
