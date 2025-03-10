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
    apiKey: 'AIzaSyC3T1G-CBXMLjzjFbKCRjsmosDUoCjnOV0',
    appId: '1:644367879552:web:89dbfddda60250e58bc565',
    messagingSenderId: '644367879552',
    projectId: 'login-5bc25',
    authDomain: 'login-5bc25.firebaseapp.com',
    storageBucket: 'login-5bc25.appspot.com',
    measurementId: 'G-C0JN75PD13',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9TaDcQeZn_hyfrcX4L1nCKAus5xf52XA',
    appId: '1:644367879552:android:be5abd8606e745e68bc565',
    messagingSenderId: '644367879552',
    projectId: 'login-5bc25',
    storageBucket: 'login-5bc25.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBd5HkIv0oW854xjuJgGX00wuxeE29H6P0',
    appId: '1:644367879552:ios:7e7950242740f4428bc565',
    messagingSenderId: '644367879552',
    projectId: 'login-5bc25',
    storageBucket: 'login-5bc25.appspot.com',
    iosBundleId: 'com.sauli.pos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBd5HkIv0oW854xjuJgGX00wuxeE29H6P0',
    appId: '1:644367879552:ios:7e7950242740f4428bc565',
    messagingSenderId: '644367879552',
    projectId: 'login-5bc25',
    storageBucket: 'login-5bc25.appspot.com',
    iosBundleId: 'com.sauli.pos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3T1G-CBXMLjzjFbKCRjsmosDUoCjnOV0',
    appId: '1:644367879552:web:a7e44ad456539ff08bc565',
    messagingSenderId: '644367879552',
    projectId: 'login-5bc25',
    authDomain: 'login-5bc25.firebaseapp.com',
    storageBucket: 'login-5bc25.appspot.com',
    measurementId: 'G-H5FWGM1TCW',
  );
}
