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
    apiKey: 'AIzaSyBn_I7G4qVRBeUgdOkUuG1NJsLo5ovukx8',
    appId: '1:656380552767:web:5ff1673a7630733fe13a8a',
    messagingSenderId: '656380552767',
    projectId: 'phone1-ea2e0',
    authDomain: 'phone1-ea2e0.firebaseapp.com',
    storageBucket: 'phone1-ea2e0.appspot.com',
    measurementId: 'G-5SKT349CNS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-acG9DqeYHMpfwjh0-ilJkGmlcRwM3fw',
    appId: '1:656380552767:android:849ad87de15d3b68e13a8a',
    messagingSenderId: '656380552767',
    projectId: 'phone1-ea2e0',
    storageBucket: 'phone1-ea2e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_I4tIbyPpplxyVOKnFu3lXTOwuMPn95I',
    appId: '1:656380552767:ios:ffdb387fff5e9e3fe13a8a',
    messagingSenderId: '656380552767',
    projectId: 'phone1-ea2e0',
    storageBucket: 'phone1-ea2e0.appspot.com',
    iosBundleId: 'com.example.phoneAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_I4tIbyPpplxyVOKnFu3lXTOwuMPn95I',
    appId: '1:656380552767:ios:e0da333bdefb37fee13a8a',
    messagingSenderId: '656380552767',
    projectId: 'phone1-ea2e0',
    storageBucket: 'phone1-ea2e0.appspot.com',
    iosBundleId: 'com.example.phoneAuth.RunnerTests',
  );
}
