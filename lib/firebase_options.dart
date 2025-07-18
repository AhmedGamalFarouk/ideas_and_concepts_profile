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
    apiKey: 'AIzaSyDOfL2Hw1-tbfgx5GaV_SoTETQMJdyVlBc',
    appId: '1:1010656709254:web:0c5719d142f1173e2e5f07',
    messagingSenderId: '1010656709254',
    projectId: 'ideas-and-concepts-tasks',
    authDomain: 'ideas-and-concepts-tasks.firebaseapp.com',
    storageBucket: 'ideas-and-concepts-tasks.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChJjPkTs6zkpFTg4D5QHa0-UglybBDYzs',
    appId: '1:1010656709254:android:a9ee72d5a38648652e5f07',
    messagingSenderId: '1010656709254',
    projectId: 'ideas-and-concepts-tasks',
    storageBucket: 'ideas-and-concepts-tasks.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDkJ6-rnl1fuqHy0RNC3yXfWBvr3z1lKY',
    appId: '1:1010656709254:ios:fc9a9af37fb05daa2e5f07',
    messagingSenderId: '1010656709254',
    projectId: 'ideas-and-concepts-tasks',
    storageBucket: 'ideas-and-concepts-tasks.firebasestorage.app',
    iosBundleId: 'com.example.ideasAndConceptsProfile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDkJ6-rnl1fuqHy0RNC3yXfWBvr3z1lKY',
    appId: '1:1010656709254:ios:fc9a9af37fb05daa2e5f07',
    messagingSenderId: '1010656709254',
    projectId: 'ideas-and-concepts-tasks',
    storageBucket: 'ideas-and-concepts-tasks.firebasestorage.app',
    iosBundleId: 'com.example.ideasAndConceptsProfile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOfL2Hw1-tbfgx5GaV_SoTETQMJdyVlBc',
    appId: '1:1010656709254:web:2988885ff8fef9ca2e5f07',
    messagingSenderId: '1010656709254',
    projectId: 'ideas-and-concepts-tasks',
    authDomain: 'ideas-and-concepts-tasks.firebaseapp.com',
    storageBucket: 'ideas-and-concepts-tasks.firebasestorage.app',
  );
}
