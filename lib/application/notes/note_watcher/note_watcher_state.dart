part of 'note_watcher_bloc.dart';

@freezed
class NoteWatcherState with _$NoteWatcherState {
  const factory NoteWatcherState.initial() = _Initial;
  const factory NoteWatcherState.loadInProgress() = DataTransferInProgress;
  const factory NoteWatcherState.loadSuccess(KtList<Note> notes) = LoadSuccess;
  const factory NoteWatcherState.loadFailure(NoteFailure noteFailure) =
      LoadFailure;
}
