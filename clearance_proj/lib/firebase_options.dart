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
    apiKey: 'AIzaSyALRS0zqKiS5rKdaoT_3wgWTZltu5A12-E',
    appId: '1:664719624854:web:4fdde7830e1eed4f21d0b7',
    messagingSenderId: '664719624854',
    projectId: 'clearance-db-49617',
    authDomain: 'clearance-db-49617.firebaseapp.com',
    storageBucket: 'clearance-db-49617.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBmrwq7CP7ImkKroHLd9TeySkeZAwwNJs',
    appId: '1:664719624854:android:f3ec8bd2143b0a6821d0b7',
    messagingSenderId: '664719624854',
    projectId: 'clearance-db-49617',
    storageBucket: 'clearance-db-49617.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaD5mcUE8N0LxG4ZBn7AgBAIssfx-7p5Y',
    appId: '1:664719624854:ios:1f860392e077871221d0b7',
    messagingSenderId: '664719624854',
    projectId: 'clearance-db-49617',
    storageBucket: 'clearance-db-49617.appspot.com',
    iosBundleId: 'com.example.clearanceProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaD5mcUE8N0LxG4ZBn7AgBAIssfx-7p5Y',
    appId: '1:664719624854:ios:b4d3b66ae1aa32ba21d0b7',
    messagingSenderId: '664719624854',
    projectId: 'clearance-db-49617',
    storageBucket: 'clearance-db-49617.appspot.com',
    iosBundleId: 'com.example.clearanceProj.RunnerTests',
  );
}
