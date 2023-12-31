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
    apiKey: 'AIzaSyBWZDSL_C2ahpaNJ-zVbjJCfBVke7IYZnQ',
    appId: '1:596138760475:web:120f0d776ccd17f5f91bbe',
    messagingSenderId: '596138760475',
    projectId: 'chatapptute-89999',
    authDomain: 'chatapptute-89999.firebaseapp.com',
    storageBucket: 'chatapptute-89999.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbkL7EItJptxTXp9JbO2M9IMRfjm9r3HI',
    appId: '1:596138760475:android:74b6647d562b4da7f91bbe',
    messagingSenderId: '596138760475',
    projectId: 'chatapptute-89999',
    storageBucket: 'chatapptute-89999.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZmOOzpdUbhtT2Urk6exkZCAGZj4wSUF0',
    appId: '1:596138760475:ios:70a0b0d3acbdf1a4f91bbe',
    messagingSenderId: '596138760475',
    projectId: 'chatapptute-89999',
    storageBucket: 'chatapptute-89999.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZmOOzpdUbhtT2Urk6exkZCAGZj4wSUF0',
    appId: '1:596138760475:ios:d5b0fc33e7ab2c84f91bbe',
    messagingSenderId: '596138760475',
    projectId: 'chatapptute-89999',
    storageBucket: 'chatapptute-89999.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
