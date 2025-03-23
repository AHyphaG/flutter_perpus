import 'package:flutter/material.dart';
import 'package:flutter_perpus/enums.dart';
import 'package:flutter_perpus/modules/home/src/screens/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.selectedMenu});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 245, 76, 76).withOpacity(0.5),
            blurRadius: 20,
            offset: Offset(0, -15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            color:
                selectedMenu == MenuState.home
                    ? Colors.white
                    : Colors.grey.shade400,
            onPressed:
                () => Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.routeName,
                ),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            color:
                selectedMenu == MenuState.cart
                    ? Colors.white
                    : Colors.grey.shade400,
            onPressed:
                () => Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.routeName,
                ),
          ),
          IconButton(
            icon: Icon(Icons.article_rounded),
            color:
                selectedMenu == MenuState.bookings
                    ? Colors.white
                    : Colors.grey.shade400,
            onPressed:
                () => Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.routeName,
                ),
          ),
          IconButton(
            icon: Icon(Icons.person),
            color:
                selectedMenu == MenuState.profile
                    ? Colors.white
                    : Colors.grey.shade400,
            onPressed:
                () => Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.routeName,
                ),
          ),
        ],
      ),
    );
  }
}
