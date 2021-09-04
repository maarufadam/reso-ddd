import 'package:dartz/dartz.dart';
import 'auth_failure.dart';
import 'value_objects.dart';

import 'custom_user.dart';

abstract class IAuthFacade {
  Future<Option<CustomUser>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
