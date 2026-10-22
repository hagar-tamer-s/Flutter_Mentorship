import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velora_app/features/auth/presentation/screens/log_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) => AuthCubit(),
        child: LogInScreen(),
      ),
    );
  }
}
