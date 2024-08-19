import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/my_colors.dart';
import '../../../core/themes/size.dart';
import '../../../utils/custom_button.dart';
import 'google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthMethods _authMethods = AuthMethods();

  bool visible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.padding! * 0.035),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Launcher Icon.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.01,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Tap Review',
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: MyColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.06,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                        color: MyColors.secondaryColor,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Card(
                      elevation: 5,
                      color: MyColors.secondaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.padding! * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.primaryColor),
                            ),
                            // SizedBox(
                            //   height: SizeConfig.screenHeight! * 0.05,
                            // ),
                            Center(
                              child: Image.asset(
                                "assets/images/scan.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(
                                child: Text(
                              "Authentication",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: MyColors.primaryColor),
                            )),

                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.03,
                            ),
                            CustomButton(
                                title: "Login With Google",
                                textColor: MyColors.secondaryColor,
                                bgColor: MyColors.primaryColor,
                                onPressed: () async {
                                  await _authMethods.signInWithGoogle();
                                }),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " newUser?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColors.textSecondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
