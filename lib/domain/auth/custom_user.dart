import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/entity.dart';
import '../core/failures.dart';
import '../core/value_objects.dart';

import 'value_objects.dart';

part 'custom_user.freezed.dart';

@freezed
class CustomUser with _$CustomUser, IEntity {
  const factory CustomUser({
    required UniqueId id,
    required StringSingleLine name,
    required EmailAddress emailAddress,
  }) = _CustomUser;

  const CustomUser._(); // Added constructor

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }
}
