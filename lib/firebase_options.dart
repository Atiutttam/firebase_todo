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
    apiKey: 'AIzaSyCrfH7OYBslHwl23iIo54y15DEgar0jayc',
    appId: '1:198172608582:web:c269415b08f88c2f67e247',
    messagingSenderId: '198172608582',
    projectId: 'my-project-1a16d',
    authDomain: 'my-project-1a16d.firebaseapp.com',
    storageBucket: 'my-project-1a16d.appspot.com',
    measurementId: 'G-CYWRYT90EV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlQiXoZAOUxC9DeL8DJ1ehSF65srgtFMA',
    appId: '1:198172608582:android:7838391351f6ad4867e247',
    messagingSenderId: '198172608582',
    projectId: 'my-project-1a16d',
    storageBucket: 'my-project-1a16d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABJ6fWLTAYYWBLFoy7MmcY_hn9bsxx-pk',
    appId: '1:198172608582:ios:b08e2364c6b67c0f67e247',
    messagingSenderId: '198172608582',
    projectId: 'my-project-1a16d',
    storageBucket: 'my-project-1a16d.appspot.com',
    iosBundleId: 'com.example.firebaseTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABJ6fWLTAYYWBLFoy7MmcY_hn9bsxx-pk',
    appId: '1:198172608582:ios:b08e2364c6b67c0f67e247',
    messagingSenderId: '198172608582',
    projectId: 'my-project-1a16d',
    storageBucket: 'my-project-1a16d.appspot.com',
    iosBundleId: 'com.example.firebaseTodo',
  );
}
