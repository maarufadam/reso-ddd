import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'presentation/routes/app_router.gr.dart';
import 'injection.dart';
import 'presentation/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(AppWidget());
}
