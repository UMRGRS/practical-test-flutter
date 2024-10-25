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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAo2K4zpyfdes3zfIKwI23y3XzSKGQlpUk',
    appId: '1:323128362353:web:4aa153b70bc892077b22d0',
    messagingSenderId: '323128362353',
    projectId: 'practical-test-70726',
    authDomain: 'practical-test-70726.firebaseapp.com',
    storageBucket: 'practical-test-70726.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwChgvwplbhhdiz7wTuU0VN4Bk0T8pqeg',
    appId: '1:323128362353:android:6d72b7d8c49c80937b22d0',
    messagingSenderId: '323128362353',
    projectId: 'practical-test-70726',
    storageBucket: 'practical-test-70726.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAo2K4zpyfdes3zfIKwI23y3XzSKGQlpUk',
    appId: '1:323128362353:web:b7ac6fd4602101b47b22d0',
    messagingSenderId: '323128362353',
    projectId: 'practical-test-70726',
    authDomain: 'practical-test-70726.firebaseapp.com',
    storageBucket: 'practical-test-70726.appspot.com',
  );
}