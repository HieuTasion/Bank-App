import 'package:flutter/material.dart';
import 'package:frontend/auth/presentation/forgot_password_screen.dart';
import 'package:frontend/auth/presentation/login_screen.dart';
import 'package:frontend/auth/presentation/regsiter_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}


