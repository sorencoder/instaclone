import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/responsive/mobile_screen_layout.dart';
import 'package:instaclone/responsive/responsive_layout.dart';
import 'package:instaclone/responsive/web_screen_layout.dart';
import 'package:instaclone/screens/login_screen.dart';
import 'package:instaclone/theme/colors.dart';

import 'screens/sing_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAafXov_2gr9-pAyi_vLwujKdgBAgwrfGs",
            appId: "1:779495079723:web:1b990ee22926fb3a494f6e",
            messagingSenderId: "779495079723",
            projectId: "instaclone-23ab3",
            storageBucket: "instaclone-23ab3.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaClone',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
          brightness: Brightness.dark),
      // home: const ResponsvieLayout(
      //     mobileScreenLayout: mobileScreenLayout(),
      //     webScreenLayout: webScreenLayout()),
      home: const LoginScreen(),
    );
  }
}
