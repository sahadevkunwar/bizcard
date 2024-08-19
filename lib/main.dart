import 'package:biz_card/features/presentation/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/core/themes/size.dart';
import 'features/core/themes/theme.dart';
import 'features/presentation/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // //******************Hive */

  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // await Hive.initFlutter();
  // Hive.registerAdapter(ContactModelAdapter());
  // await Hive.openBox<ContactModel>("contact");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarBloc(),
        ),
      
     
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(context),
        home: const SplashScreen(),
      ),
    );
  }
}
