// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i14;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i13;
import 'application/notes/note_actor/note_actor_bloc.dart' as _i10;
import 'application/notes/note_form/note_form_bloc.dart' as _i11;
import 'application/notes/note_watcher/note_watcher_bloc.dart' as _i12;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/notes/i_note_repository.dart' as _i8;
import 'infastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infastructure/auth/firebase_user_mapper.dart' as _i3;
import 'infastructure/core/firebase_injectable_module.dart' as _i15;
import 'infastructure/core/firestore_helpers.dart' as _i4;
import 'infastructure/notes/note_repository.dart' as _i9;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i6.IAuthFacade>(
      () => _i7.FirebaseAuthFacade(
          get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()),
      registerFor: {_prod});
  gh.factory<_i8.INoteRepository>(
      () => _i9.NoteRepository(get<_i4.FirebaseFirestore>()),
      registerFor: {_prod});
  gh.factory<_i10.NoteActorBloc>(
      () => _i10.NoteActorBloc(get<_i8.INoteRepository>()));
  gh.factory<_i11.NoteFormBloc>(
      () => _i11.NoteFormBloc(get<_i8.INoteRepository>()));
  gh.factory<_i12.NoteWatcherBloc>(
      () => _i12.NoteWatcherBloc(get<_i8.INoteRepository>()));
  gh.factory<_i13.SignInFormBloc>(
      () => _i13.SignInFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i15.FirebaseInjectableModule {}