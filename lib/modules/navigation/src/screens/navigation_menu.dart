import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/widgets/custom_navbar.dart';
import '../navbar_bloc.dart/navbar_bloc.dart'; // import bloc-nya

import 'package:flutter_perpus/modules/home/src/screens/home_screen.dart';
import 'package:flutter_perpus/modules/profile/src/screens/profile_screen.dart';
// import module lainnya

class NavigationMenu extends StatelessWidget {
  static const routeName = '/main';
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        Widget screen;
        switch (state.selectedMenu) {
          case MenuState.home:
            screen = const HomeScreen();
            break;
          case MenuState.cart:
            screen = const Center(child: Text("Cart"));
            break;
          case MenuState.bookings:
            screen = const Center(child: Text("Bookings"));
            break;
          case MenuState.profile:
            screen = ProfileScreen();
            break;
        }

        return Scaffold(
          body: screen,
          bottomNavigationBar: const CustomNavBar(),
        );
      },
    );
  }
}
