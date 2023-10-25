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
    apiKey: 'AIzaSyDUpAKJsQRNi6ZKlqIUeVlmreF7Qo-8YMA',
    appId: '1:481586774396:web:61c1fda97854080f8064f9',
    messagingSenderId: '481586774396',
    projectId: 'aps-ar-wayfinding',
    authDomain: 'aps-ar-wayfinding.firebaseapp.com',
    databaseURL: 'https://aps-ar-wayfinding-default-rtdb.firebaseio.com',
    storageBucket: 'aps-ar-wayfinding.appspot.com',
    measurementId: 'G-CC0TS95RSD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6FZHNsnlvFkAnCnXlxwO3yttTplXlD38',
    appId: '1:481586774396:android:d26160487079b0328064f9',
    messagingSenderId: '481586774396',
    projectId: 'aps-ar-wayfinding',
    databaseURL: 'https://aps-ar-wayfinding-default-rtdb.firebaseio.com',
    storageBucket: 'aps-ar-wayfinding.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkpX0cipMoCrYzxkKnGPJ__8RJWWcK0MM',
    appId: '1:481586774396:ios:fc733a024e6706238064f9',
    messagingSenderId: '481586774396',
    projectId: 'aps-ar-wayfinding',
    databaseURL: 'https://aps-ar-wayfinding-default-rtdb.firebaseio.com',
    storageBucket: 'aps-ar-wayfinding.appspot.com',
    iosClientId: '481586774396-joc6k7rpr7jaguolripo7qq34krti66j.apps.googleusercontent.com',
    iosBundleId: 'com.example.arImplementation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkpX0cipMoCrYzxkKnGPJ__8RJWWcK0MM',
    appId: '1:481586774396:ios:fc733a024e6706238064f9',
    messagingSenderId: '481586774396',
    projectId: 'aps-ar-wayfinding',
    databaseURL: 'https://aps-ar-wayfinding-default-rtdb.firebaseio.com',
    storageBucket: 'aps-ar-wayfinding.appspot.com',
    iosClientId: '481586774396-joc6k7rpr7jaguolripo7qq34krti66j.apps.googleusercontent.com',
    iosBundleId: 'com.example.arImplementation',
  );
}
