import 'package:flutter/material.dart';
import 'package:flutter_perpus/enums.dart';
import 'package:flutter_perpus/modules/home/src/screens/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.selectedMenu});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(
              245,
              76,
              76,
              0.5,
            ), // Ganti dengan Color.fromRGBO
            blurRadius: 20,
            offset: const Offset(0, -15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            Icons.home,
            MenuState.home,
            HomeScreen.routeName,
          ),
          _buildNavItem(
            context,
            Icons.shopping_cart_rounded,
            MenuState.cart,
            HomeScreen.routeName,
          ),
          _buildNavItem(
            context,
            Icons.article_rounded,
            MenuState.bookings,
            HomeScreen.routeName,
          ),
          _buildNavItem(
            context,
            Icons.person,
            MenuState.profile,
            HomeScreen.routeName,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    MenuState menu,
    String route,
  ) {
    return IconButton(
      icon: Icon(icon),
      color: selectedMenu == menu ? Colors.white : Colors.grey.shade400,
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}
