import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/errors.dart';
import '../../injection.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  /// The user must be already authenticated when calling this method.
  /// Otherwise, throws [NotAuthenticatedError].
  Future<DocumentReference<Map<String, dynamic>>> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference<Map<String, dynamic>> get noteCollection =>
      collection('notes');

  /// Nested subcollection under a [noteCollection]'s document.
  CollectionReference<Map<String, dynamic>> get todoCollection =>
      collection('todos');

  // <Map<String, dynamic>>
}
