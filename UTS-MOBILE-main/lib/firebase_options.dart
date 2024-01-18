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
    apiKey: 'AIzaSyBWvd3Yrmuc0ztGV90DZF1F4vOgF_V_C04',
    appId: '1:834447557887:web:14f89c72174546b871f8ca',
    messagingSenderId: '834447557887',
    projectId: 'aexonjp',
    authDomain: 'aexonjp.firebaseapp.com',
    storageBucket: 'aexonjp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjREW49pHR-VlFYvmps_HkP1SkHXpP8Pg',
    appId: '1:834447557887:android:cdb82d901bd62ff371f8ca',
    messagingSenderId: '834447557887',
    projectId: 'aexonjp',
    storageBucket: 'aexonjp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCx9YITCgB6IYzLeDdpZKRu6Pxw7BWygDY',
    appId: '1:834447557887:ios:d8659306eae0fbbf71f8ca',
    messagingSenderId: '834447557887',
    projectId: 'aexonjp',
    storageBucket: 'aexonjp.appspot.com',
    iosBundleId: 'com.example.pirantiBergerak',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCx9YITCgB6IYzLeDdpZKRu6Pxw7BWygDY',
    appId: '1:834447557887:ios:95377aeed583221c71f8ca',
    messagingSenderId: '834447557887',
    projectId: 'aexonjp',
    storageBucket: 'aexonjp.appspot.com',
    iosBundleId: 'com.example.pirantiBergerak.RunnerTests',
  );
}