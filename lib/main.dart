import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_app/firebase_options.dart';
import 'package:music_app/forgot.dart';
import 'package:music_app/login.dart';
import 'package:music_app/musichome.dart';
import 'package:music_app/playhome1.dart';
import 'package:music_app/playhome2.dart';
import 'package:music_app/playhome3.dart';
import 'package:music_app/register.dart';
import 'package:music_app/services/authservices.dart';
import 'package:music_app/splash.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        '/': (context) => Splashscreen(),
        '/login': (context) => Loginscreen(),
        'register': (context) => Registerscreen(),
        '/forgot': (context) => Forgotscreen(),
        '/musichome': (context) => Musichomescreen(),
        '/playhome1': (context) => Playhomecreen1(),
        '/playhome2': (context) => Playhomecreen2(),
        '/playhome3': (context) => Playhomecreen3(),
      },
    );
  }
}
