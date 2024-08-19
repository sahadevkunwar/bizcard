import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/constants/my_colors.dart';
import '../../core/themes/size.dart';
import 'auth/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delayed navigation to the second screen
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Wrapper()),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/Launcher Icon.png",
            width: SizeConfig.padding! * 0.5,
          )),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Tap Review',
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
            repeatForever: true,
          ),
        ],
      ),
    );
  }
}