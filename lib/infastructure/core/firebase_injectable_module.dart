import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../auth/firebase_user_mapper.dart';

import 'firestore_helpers.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
