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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC5ctNnQ24J3_8aPgbs8qCO0LSbb5Eybkw',
    appId: '1:1000561794018:web:c0642f25b36ceda35077bb',
    messagingSenderId: '1000561794018',
    projectId: 'syllabus-pedia-dd7ba',
    authDomain: 'syllabus-pedia-dd7ba.firebaseapp.com',
    storageBucket: 'syllabus-pedia-dd7ba.firebasestorage.app',
    measurementId: 'G-F39H51DE5J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM7KSiyJMMuBVzRIYf5AL03z5qsk98orA',
    appId: '1:1000561794018:android:7b9353e6b8ab2a1d5077bb',
    messagingSenderId: '1000561794018',
    projectId: 'syllabus-pedia-dd7ba',
    storageBucket: 'syllabus-pedia-dd7ba.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFbcYqlXObdMkM1Ske_WoARyMkPeJaito',
    appId: '1:1000561794018:ios:f1c19885eb1dfc1e5077bb',
    messagingSenderId: '1000561794018',
    projectId: 'syllabus-pedia-dd7ba',
    storageBucket: 'syllabus-pedia-dd7ba.firebasestorage.app',
    iosBundleId: 'com.ict.syllabusPedia',
  );
}
