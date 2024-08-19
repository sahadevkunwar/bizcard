import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../button_nav_bar_screen.dart';
import 'login_screen.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !kIsWeb
          ? StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const BottomNavBarScreen();
                } else {
                  return const LoginScreen();
                }
              })
          : Container(
              height: 100,
              color: Colors.red,
              child: const Text("This is web version nfc app,")),
    );
  }
}