// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMN6ySK8UID8joGvhL0FUDPbAZ-MH4zyU',
    appId: '1:125475575024:android:d73d0dab222218a7d3de35',
    messagingSenderId: '125475575024',
    projectId: 'brum-89bac',
    storageBucket: 'brum-89bac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjnDcWk3hWjiC2O3yH8w-tfSygZFGyCdE',
    appId: '1:125475575024:ios:22ffcfd541cb0586d3de35',
    messagingSenderId: '125475575024',
    projectId: 'brum-89bac',
    storageBucket: 'brum-89bac.appspot.com',
    iosClientId: '125475575024-6u0otf6ebfas05vvbhn77gv1ul795a8m.apps.googleusercontent.com',
    iosBundleId: 'io.andree.brum',
  );
}
