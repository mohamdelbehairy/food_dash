import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_state.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  SharedPrefCubit() : super(SharedPrefInitial());

  Future<void> setSharedPref(
      {required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    emit(SetSharedPrefSuccess());
  }

  Future<String> getSharedPref({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    emit(GetSharedPrefSuccess());
    return prefs.getString(key) ?? '';
  }
}
