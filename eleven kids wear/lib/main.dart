import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // صفحة البداية
import 'screens/main_layout.dart'; // صفحة التابات (الناف بار السفلي)

void main() {
  runApp(const ElevenKidsWearApp());
}

class ElevenKidsWearApp extends StatelessWidget {
  const ElevenKidsWearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eleven Kids Wear 👕',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB388EB),
        scaffoldBackgroundColor: Color(0xFFFCEFF9),
        fontFamily: 'Cairo', // اختياري لو عندك خط معين
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB388EB),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFB388EB),
          unselectedItemColor: Colors.grey,
        ),
      ),
      home:  SplashScreen(), // البداية من Splash
    );
  }
}
