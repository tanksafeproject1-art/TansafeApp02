import 'package:flutter/material.dart';
import 'package:tanksafe/theme.dart';
import 'package:tanksafe/screens/home_screen.dart';

void main() {
  runApp(const TankSafeApp());
}

class TankSafeApp extends StatelessWidget {
  const TankSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TankSafe - Anti-Siphon Solutions',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
