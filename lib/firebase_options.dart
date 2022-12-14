// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBz4PdwZ1SPO6mvUG-VwGWhzWPpDbrEDMM',
    appId: '1:647323808840:web:ab13efcbbaf706d285947d',
    messagingSenderId: '647323808840',
    projectId: 'market-d5223',
    authDomain: 'market-d5223.firebaseapp.com',
    storageBucket: 'market-d5223.appspot.com',
    measurementId: 'G-KP0V31T6P5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBafIa2fzhPWQkmyfV3YJ5rPqd6FrsFyX8',
    appId: '1:647323808840:android:ce7478d2aed0956f85947d',
    messagingSenderId: '647323808840',
    projectId: 'market-d5223',
    storageBucket: 'market-d5223.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9fQxqlZPRAHBH7yZ1cHf0c3h86RNYGiw',
    appId: '1:647323808840:ios:9c7f9357997951db85947d',
    messagingSenderId: '647323808840',
    projectId: 'market-d5223',
    storageBucket: 'market-d5223.appspot.com',
    iosClientId: '647323808840-6f8q1mt5ortlk4bpaq23nkdboodonk2v.apps.googleusercontent.com',
    iosBundleId: 'com.example.market',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9fQxqlZPRAHBH7yZ1cHf0c3h86RNYGiw',
    appId: '1:647323808840:ios:9c7f9357997951db85947d',
    messagingSenderId: '647323808840',
    projectId: 'market-d5223',
    storageBucket: 'market-d5223.appspot.com',
    iosClientId: '647323808840-6f8q1mt5ortlk4bpaq23nkdboodonk2v.apps.googleusercontent.com',
    iosBundleId: 'com.example.market',
  );
}
