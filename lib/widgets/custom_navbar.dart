import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/modules/navigation/src/navbar_bloc.dart/navbar_bloc.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      buildWhen: (prev, curr) => prev.selectedMenu != curr.selectedMenu,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, -15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                navigationBarTheme: NavigationBarThemeData(
                  indicatorColor: Theme.of(context).indicatorColor,
                  backgroundColor: Theme.of(context).primaryColor,
                  labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
                    states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      return const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      );
                    }
                    return const TextStyle(color: Colors.white);
                  }),
                  iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((
                    states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      return const IconThemeData(color: Colors.greenAccent);
                    }
                    return const IconThemeData(color: Colors.white);
                  }),
                ),
              ),
              child: NavigationBar(
                height: 80,
                shadowColor: const Color.fromARGB(
                  255,
                  97,
                  53,
                  179,
                ).withOpacity(0.3),
                // surfaceTintColor: const Color.fromARGB(255, 113, 32, 179),
                backgroundColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).indicatorColor,
                selectedIndex: state.selectedMenu.index,
                onDestinationSelected: (index) {
                  final selectedMenu = MenuState.values[index];
                  context.read<NavBarBloc>().add(ChangeMenuEvent(selectedMenu));
                },
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.article),
                    label: 'Bookings',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
