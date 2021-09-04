import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/auth/custom_user.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/value_objects.dart';

export 'package:firebase_auth/firebase_auth.dart';

// @lazySingleton
// class FirebaseUserMapper {
//   CustomUser? toDomain(User? _) {
//     return _ == null
//         ? null
//         : CustomUser(
//             id: UniqueId.fromUniqueString(_.uid),
//             name: StringSingleLine(_.displayName ?? _.email!.split('@').first),
//             emailAddress: EmailAddress(_.email!),
//           );
//   }
// }

extension UserX on User {
  CustomUser? toDomain() {
    final _ = FirebaseAuth.instance.currentUser;

    return _ == null
        ? null
        : CustomUser(
            id: UniqueId.fromUniqueString(_.uid),
            name: StringSingleLine(_.displayName ?? _.email!.split('@').first),
            emailAddress: EmailAddress(_.email!),
          );
  }
}
