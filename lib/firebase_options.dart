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
    apiKey: 'AIzaSyAY58UKWNjGvVrNb_1EnrD3PM-NniXbnlA',
    appId: '1:1048773568402:web:35ff4b782e68bc09df434b',
    messagingSenderId: '1048773568402',
    projectId: 'team-2-database',
    authDomain: 'team-2-database.firebaseapp.com',
    databaseURL: 'https://team-2-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'team-2-database.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBg_iTFVnaHp3EMIt8aWx4KgdEPumjT6T0',
    appId: '1:1048773568402:android:1a537c660ad528f9df434b',
    messagingSenderId: '1048773568402',
    projectId: 'team-2-database',
    databaseURL: 'https://team-2-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'team-2-database.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAd0oYhcVgK0JQfv57wSzQVekJxFjGUfnc',
    appId: '1:1048773568402:ios:f9d87ea57013069adf434b',
    messagingSenderId: '1048773568402',
    projectId: 'team-2-database',
    databaseURL: 'https://team-2-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'team-2-database.appspot.com',
    iosClientId: '1048773568402-bjsshdhshl060pa93b805p194u8gj298.apps.googleusercontent.com',
    iosBundleId: 'com.gbpl2023.test1.gbpl2023',
  );
}
