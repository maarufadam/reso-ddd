// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'custom_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomUserTearOff {
  const _$CustomUserTearOff();

  _CustomUser call(
      {required UniqueId id,
      required StringSingleLine name,
      required EmailAddress emailAddress}) {
    return _CustomUser(
      id: id,
      name: name,
      emailAddress: emailAddress,
    );
  }
}

/// @nodoc
const $CustomUser = _$CustomUserTearOff();

/// @nodoc
mixin _$CustomUser {
  UniqueId get id => throw _privateConstructorUsedError;
  StringSingleLine get name => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomUserCopyWith<CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserCopyWith<$Res> {
  factory $CustomUserCopyWith(
          CustomUser value, $Res Function(CustomUser) then) =
      _$CustomUserCopyWithImpl<$Res>;
  $Res call({UniqueId id, StringSingleLine name, EmailAddress emailAddress});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res> implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  final CustomUser _value;
  // ignore: unused_field
  final $Res Function(CustomUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
    ));
  }
}

/// @nodoc
abstract class _$CustomUserCopyWith<$Res> implements $CustomUserCopyWith<$Res> {
  factory _$CustomUserCopyWith(
          _CustomUser value, $Res Function(_CustomUser) then) =
      __$CustomUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, StringSingleLine name, EmailAddress emailAddress});
}

/// @nodoc
class __$CustomUserCopyWithImpl<$Res> extends _$CustomUserCopyWithImpl<$Res>
    implements _$CustomUserCopyWith<$Res> {
  __$CustomUserCopyWithImpl(
      _CustomUser _value, $Res Function(_CustomUser) _then)
      : super(_value, (v) => _then(v as _CustomUser));

  @override
  _CustomUser get _value => super._value as _CustomUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
  }) {
    return _then(_CustomUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
    ));
  }
}

/// @nodoc

class _$_CustomUser extends _CustomUser with DiagnosticableTreeMixin {
  const _$_CustomUser(
      {required this.id, required this.name, required this.emailAddress})
      : super._();

  @override
  final UniqueId id;
  @override
  final StringSingleLine name;
  @override
  final EmailAddress emailAddress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomUser(id: $id, name: $name, emailAddress: $emailAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('emailAddress', emailAddress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(emailAddress);

  @JsonKey(ignore: true)
  @override
  _$CustomUserCopyWith<_CustomUser> get copyWith =>
      __$CustomUserCopyWithImpl<_CustomUser>(this, _$identity);
}

abstract class _CustomUser extends CustomUser {
  const factory _CustomUser(
      {required UniqueId id,
      required StringSingleLine name,
      required EmailAddress emailAddress}) = _$_CustomUser;
  const _CustomUser._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  StringSingleLine get name => throw _privateConstructorUsedError;
  @override
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomUserCopyWith<_CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}
