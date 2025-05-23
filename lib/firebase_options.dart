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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-yQIBDjY8QQYotqhOHFgG4YFhc2CYgRE',
    appId: '1:553468589379:android:3eff34ea1d9faa8a466bf6',
    messagingSenderId: '553468589379',
    projectId: 'chefme-636c1',
    storageBucket: 'chefme-636c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTg1JsXi1NxBG-vOfRu9LAtyDrqgTdDtI',
    appId: '1:553468589379:ios:3c54312b455de924466bf6',
    messagingSenderId: '553468589379',
    projectId: 'chefme-636c1',
    storageBucket: 'chefme-636c1.appspot.com',
    iosBundleId: 'com.example.chefmeprime',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBF7q5b35sSAym8mlXGJU0fDOLayc2H_QQ',
    appId: '1:553468589379:web:7cde892f08f23987466bf6',
    messagingSenderId: '553468589379',
    projectId: 'chefme-636c1',
    authDomain: 'chefme-636c1.firebaseapp.com',
    storageBucket: 'chefme-636c1.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBF7q5b35sSAym8mlXGJU0fDOLayc2H_QQ',
    appId: '1:553468589379:web:efe85d0133f75c8e466bf6',
    messagingSenderId: '553468589379',
    projectId: 'chefme-636c1',
    authDomain: 'chefme-636c1.firebaseapp.com',
    storageBucket: 'chefme-636c1.appspot.com',
  );

}