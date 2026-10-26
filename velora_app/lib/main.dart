import 'package:flutter/material.dart';
import 'package:velora_app/core/utils/app_shared_preferences.dart';
import 'package:velora_app/features/auth/presentation/screens/log_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LogInScreen());
  }
}
