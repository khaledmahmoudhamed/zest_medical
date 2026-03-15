import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/logic/toggle/navigate_cubit.dart';
import '../appointment/appointment_screen.dart';
import '../inbox/chat_screen.dart';
import '../home/home/screen/home_screen.dart';
import '../profile/profile_items/screens/profile.dart';
import '../serach/screens/search_screen.dart';
import 'bottom_nav_bar.dart';

class BottomNavBarHolder extends StatelessWidget {
  BottomNavBarHolder({super.key});
  final List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    SearchScreen(),
    NavAppointmentItem(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorCubit, int>(
      builder: (BuildContext context, currentIndex) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavBar(
            currentIndex: currentIndex,
            onTap: (int p1) {
              context.read<NavigatorCubit>().toggle(p1);
            },
            image: '',
          ),

          body: screens[currentIndex],
        );
      },
    );
  }
}
