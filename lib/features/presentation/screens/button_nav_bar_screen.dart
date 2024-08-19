import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/my_colors.dart';
import '../bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import '../bloc/bottom_nav_bar_bloc/bottom_nav_bar_event.dart';
import '../bloc/bottom_nav_bar_bloc/bottom_nav_bar_state.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({
    super.key,
  });

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  DateTime? backButtonPressTime;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          switch (state) {
            case Page1():
              return  Container(color: Colors.red,); //NFCHome();
            case Page2():
              return   Container(color: Colors.blue,);                                //const ProfileScreen();

            default:
              return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 58,
        margin: const EdgeInsets.only(
          left: 15,
          bottom: 15,
          right: 15,
        ),
        decoration: ShapeDecoration(
          color: MyColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: MyColors.secondaryColor,
            elevation: 0.0,
            showSelectedLabels: true,
            unselectedItemColor: MyColors.primaryColor,
            showUnselectedLabels: false,
            selectedItemColor: MyColors.primaryColor,
            currentIndex: _selectedIndex,
            onTap: (currentIndex) {
              _selectedIndex = currentIndex;
              context
                  .read<BottomNavBarBloc>()
                  .add(FetchBottomNavBarEventEvent(id: currentIndex));
              (context as Element).markNeedsBuild();
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Person",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
