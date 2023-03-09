import 'package:flutter/material.dart';
import 'package:user_random/pages/random_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const RandomUserPage(),
    );
  }
}
