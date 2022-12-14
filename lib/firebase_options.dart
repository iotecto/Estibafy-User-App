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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_4rVUJVrpxyrcOg9KzGvk-SQJiMktReI',
    appId: '1:135628173298:android:9f9c5649255633bc3fc56b',
    messagingSenderId: '135628173298',
    projectId: 'estibafy-8bf0a',
    storageBucket: 'estibafy-8bf0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC07spnIHx_YNF-4-xf4kSWz4SebBiDH0U',
    appId: '1:135628173298:ios:753c032eed1e69153fc56b',
    messagingSenderId: '135628173298',
    projectId: 'estibafy-8bf0a',
    storageBucket: 'estibafy-8bf0a.appspot.com',
    androidClientId: '135628173298-uufqm5dmjg7i0l12q1i31i5h8safs26q.apps.googleusercontent.com',
    iosClientId: '135628173298-0gqosdp15daoiom581vnm5qn2u462foj.apps.googleusercontent.com',
    iosBundleId: 'estibafy.com.estibafyUser',
  );
}
