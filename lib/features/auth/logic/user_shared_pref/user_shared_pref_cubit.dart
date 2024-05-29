import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_dash/constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_shared_pref_state.dart';

class UserSharedPrefCubit extends Cubit<UserSharedPrefState> {
  UserSharedPrefCubit() : super(UserSharedPrefInitial());

  Future<void> userSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        Constants.userSharedPref, FirebaseAuth.instance.currentUser!.uid);
    emit(UserSharedPrefSuccess());
  }
}
