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
    apiKey: 'AIzaSyCKzQqFFrIqqTif166JtZItZpWchdnlLvg',
    appId: '1:1009165332547:web:c3234d964da9a2355c64f6',
    messagingSenderId: '1009165332547',
    projectId: 'phone-3eb5f',
    authDomain: 'phone-3eb5f.firebaseapp.com',
    storageBucket: 'phone-3eb5f.appspot.com',
    measurementId: 'G-TFC09YYXKE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMyiNevYDf4LZptWLvo8exEyEy2OYMeTs',
    appId: '1:1009165332547:android:c232b824daa897725c64f6',
    messagingSenderId: '1009165332547',
    projectId: 'phone-3eb5f',
    storageBucket: 'phone-3eb5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1rhr9EZw0pm2g4pAnoZEBCag-tiJiVwE',
    appId: '1:1009165332547:ios:9354285fedc24fd15c64f6',
    messagingSenderId: '1009165332547',
    projectId: 'phone-3eb5f',
    storageBucket: 'phone-3eb5f.appspot.com',
    iosBundleId: 'com.example.phoneotp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1rhr9EZw0pm2g4pAnoZEBCag-tiJiVwE',
    appId: '1:1009165332547:ios:e71533d8a3d18bc05c64f6',
    messagingSenderId: '1009165332547',
    projectId: 'phone-3eb5f',
    storageBucket: 'phone-3eb5f.appspot.com',
    iosBundleId: 'com.example.phoneotp.RunnerTests',
  );
}
