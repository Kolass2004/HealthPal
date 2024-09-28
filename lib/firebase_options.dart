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
    apiKey: 'AIzaSyBn7DUiGs-LDAR0vfOWdOT2fZoPyPV8RYM',
    appId: '1:989284168769:web:c3812f3bcc0d4cdb7c02c0',
    messagingSenderId: '989284168769',
    projectId: 'healthpal-fbb41',
    authDomain: 'healthpal-fbb41.firebaseapp.com',
    storageBucket: 'healthpal-fbb41.appspot.com',
    measurementId: 'G-BL33E3J512',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8fFF9BXRIalF9SqwCm638KVXoNogiTWw',
    appId: '1:989284168769:android:c0586e4e11f245dd7c02c0',
    messagingSenderId: '989284168769',
    projectId: 'healthpal-fbb41',
    storageBucket: 'healthpal-fbb41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAq2yMD9ys_8d7qs8ZMvxDa1rDc5rrNbzA',
    appId: '1:989284168769:ios:5e61a88e951dc3757c02c0',
    messagingSenderId: '989284168769',
    projectId: 'healthpal-fbb41',
    storageBucket: 'healthpal-fbb41.appspot.com',
    iosBundleId: 'com.example.healthPal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAq2yMD9ys_8d7qs8ZMvxDa1rDc5rrNbzA',
    appId: '1:989284168769:ios:5e61a88e951dc3757c02c0',
    messagingSenderId: '989284168769',
    projectId: 'healthpal-fbb41',
    storageBucket: 'healthpal-fbb41.appspot.com',
    iosBundleId: 'com.example.healthPal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBn7DUiGs-LDAR0vfOWdOT2fZoPyPV8RYM',
    appId: '1:989284168769:web:93e1738de70807117c02c0',
    messagingSenderId: '989284168769',
    projectId: 'healthpal-fbb41',
    authDomain: 'healthpal-fbb41.firebaseapp.com',
    storageBucket: 'healthpal-fbb41.appspot.com',
    measurementId: 'G-5E86NDQWBV',
  );
}
