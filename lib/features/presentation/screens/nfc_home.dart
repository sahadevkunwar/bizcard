import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/constants/my_colors.dart';
import 'read_nfc.dart';
import 'write_nfc.dart';



class NFCHome extends StatefulWidget {
  const NFCHome({super.key});

  @override
  State<NFCHome> createState() => _NFCHomeState();
}

class _NFCHomeState extends State<NFCHome> {
  //******logout********************************* */
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: MyColors.secondaryColor,
          appBar: AppBar(
            bottom: const TabBar(labelColor: Colors.white, tabs: [
              Tab(
                text: "Read",
              ),
              Tab(
                text: "Write",
              ),
              // Tab(
              //   text: "Write Lock",
              // )
            ]),
            title: const Text("Biz Card"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => signout(),
                  icon: const Icon(
                    Icons.logout,
                    color: MyColors.secondaryColor,
                  ))
            ],
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ReadNFC(),
                WriteNFC(),
                // NCFWriteLock(),
              ]),
        ));
  }
}
