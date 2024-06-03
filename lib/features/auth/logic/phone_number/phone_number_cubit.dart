import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberInitial());

  String verificationID = '';
  bool isLoading = false;
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    emit(SendCodeLoading(isLoading: true));
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          emit(SendCodeFailure(errorMessage: 'invalid-phone-number'));
        } else if (e.code == 'too-many-requests') {
          emit(SendCodeFailure(errorMessage: 'too-many-requests'));
        } else if (e.code == 'network-request-failed') {
          emit(SendCodeFailure(errorMessage: 'network-request-failed'));
        } else {
          emit(SendCodeFailure(errorMessage: e.toString()));
        }

        debugPrint('error from sign in with phone number method: $e');
        emit(SendCodeLoading(isLoading: false));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(SendCodeSuccess());
        verificationID = verificationId;
        emit(SendCodeLoading(isLoading: false));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyPhoneNumber({required String smsCode}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(VerifyPhoneNumberSuccess());
    } on FirebaseAuthException catch (e) {
      emit(VerifyPhoneNumberFailure(errorMessage: 'invalid-verification-code'));
      debugPrint('error from verify phone number method: $e');
    } catch (e) {
      emit(VerifyPhoneNumberFailure(errorMessage: e.toString()));
      debugPrint('error from verify phone number method: $e');
    }
  }
}
