// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBXTaON9AM9TSdDqaGiU6DbwYN_KPIA89U',
    appId: '1:1075845010658:web:cb2a4a03134e435a30fabb',
    messagingSenderId: '1075845010658',
    projectId: 'food-dash-52b17',
    authDomain: 'food-dash-52b17.firebaseapp.com',
    storageBucket: 'food-dash-52b17.appspot.com',
    measurementId: 'G-X4247BZPWL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcU_FVjgCIOj2hQ0Q7etQFjiVwFMhBja4',
    appId: '1:1075845010658:android:13e5c3fd69252d4230fabb',
    messagingSenderId: '1075845010658',
    projectId: 'food-dash-52b17',
    storageBucket: 'food-dash-52b17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEbSsMGfnhgnUtdHcTWNprUQNHQlBZXt8',
    appId: '1:1075845010658:ios:2d7d992b90a740d230fabb',
    messagingSenderId: '1075845010658',
    projectId: 'food-dash-52b17',
    storageBucket: 'food-dash-52b17.appspot.com',
    iosBundleId: 'com.example.foodDash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEbSsMGfnhgnUtdHcTWNprUQNHQlBZXt8',
    appId: '1:1075845010658:ios:2d7d992b90a740d230fabb',
    messagingSenderId: '1075845010658',
    projectId: 'food-dash-52b17',
    storageBucket: 'food-dash-52b17.appspot.com',
    iosBundleId: 'com.example.foodDash',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBXTaON9AM9TSdDqaGiU6DbwYN_KPIA89U',
    appId: '1:1075845010658:web:4d6c25bcb061d7a330fabb',
    messagingSenderId: '1075845010658',
    projectId: 'food-dash-52b17',
    authDomain: 'food-dash-52b17.firebaseapp.com',
    storageBucket: 'food-dash-52b17.appspot.com',
    measurementId: 'G-YR5T26GRJ0',
  );
}