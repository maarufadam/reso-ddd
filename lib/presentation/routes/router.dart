import 'package:auto_route/auto_route_annotations.dart';
import '../pages/notes/note_form/note_form_page.dart';
import '../pages/notes/notes_overview/notes_overview_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/splash/splash_page.dart';

@MaterialAutoRouter()
class $CustomRouter {
  @initial
  SplashPage splashPage;
  SignInPage signInPage;
  NotesOverviewPage notesOverviewPage;
  @MaterialRoute(fullscreenDialog: true)
  NoteFormPage noteFormPage;
}
