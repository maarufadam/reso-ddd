// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'icon_switch_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IconSwitchDataTearOff {
  const _$IconSwitchDataTearOff();

  _IconSwitchData call({required bool toggle, required Icon icon}) {
    return _IconSwitchData(
      toggle: toggle,
      icon: icon,
    );
  }
}

/// @nodoc
const $IconSwitchData = _$IconSwitchDataTearOff();

/// @nodoc
mixin _$IconSwitchData {
  bool get toggle => throw _privateConstructorUsedError;
  Icon get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IconSwitchDataCopyWith<IconSwitchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconSwitchDataCopyWith<$Res> {
  factory $IconSwitchDataCopyWith(
          IconSwitchData value, $Res Function(IconSwitchData) then) =
      _$IconSwitchDataCopyWithImpl<$Res>;
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class _$IconSwitchDataCopyWithImpl<$Res>
    implements $IconSwitchDataCopyWith<$Res> {
  _$IconSwitchDataCopyWithImpl(this._value, this._then);

  final IconSwitchData _value;
  // ignore: unused_field
  final $Res Function(IconSwitchData) _then;

  @override
  $Res call({
    Object? toggle = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      toggle: toggle == freezed
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc
abstract class _$IconSwitchDataCopyWith<$Res>
    implements $IconSwitchDataCopyWith<$Res> {
  factory _$IconSwitchDataCopyWith(
          _IconSwitchData value, $Res Function(_IconSwitchData) then) =
      __$IconSwitchDataCopyWithImpl<$Res>;
  @override
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class __$IconSwitchDataCopyWithImpl<$Res>
    extends _$IconSwitchDataCopyWithImpl<$Res>
    implements _$IconSwitchDataCopyWith<$Res> {
  __$IconSwitchDataCopyWithImpl(
      _IconSwitchData _value, $Res Function(_IconSwitchData) _then)
      : super(_value, (v) => _then(v as _IconSwitchData));

  @override
  _IconSwitchData get _value => super._value as _IconSwitchData;

  @override
  $Res call({
    Object? toggle = freezed,
    Object? icon = freezed,
  }) {
    return _then(_IconSwitchData(
      toggle: toggle == freezed
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc

class _$_IconSwitchData
    with DiagnosticableTreeMixin
    implements _IconSwitchData {
  const _$_IconSwitchData({required this.toggle, required this.icon});

  @override
  final bool toggle;
  @override
  final Icon icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IconSwitchData(toggle: $toggle, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IconSwitchData'))
      ..add(DiagnosticsProperty('toggle', toggle))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IconSwitchData &&
            (identical(other.toggle, toggle) ||
                const DeepCollectionEquality().equals(other.toggle, toggle)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(toggle) ^
      const DeepCollectionEquality().hash(icon);

  @JsonKey(ignore: true)
  @override
  _$IconSwitchDataCopyWith<_IconSwitchData> get copyWith =>
      __$IconSwitchDataCopyWithImpl<_IconSwitchData>(this, _$identity);
}

abstract class _IconSwitchData implements IconSwitchData {
  const factory _IconSwitchData({required bool toggle, required Icon icon}) =
      _$_IconSwitchData;

  @override
  bool get toggle => throw _privateConstructorUsedError;
  @override
  Icon get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IconSwitchDataCopyWith<_IconSwitchData> get copyWith =>
      throw _privateConstructorUsedError;
}
