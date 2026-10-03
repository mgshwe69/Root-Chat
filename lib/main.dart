import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD-xtfc0Kq2YlWddMwLw2AgGmOENysJlbE',
      appId: '1:1077119340052:android:0adb480d0adaacc4c82101',
      messagingSenderId: '1077119340052',
      projectId: 'root-chating',
      storageBucket: 'root-chating.firebasestorage.app',
    ),
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROOT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}
