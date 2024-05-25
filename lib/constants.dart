import 'package:firebase_auth/firebase_auth.dart';

class Constants {
  // firebase
  static const userCollection = 'users';

  static User currentUser = FirebaseAuth.instance.currentUser!;

  // urls
  static const userDataViewImageUrl =
      'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg';
}
