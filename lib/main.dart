import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/modules/auth/src/screens/splash_screen.dart';
import 'package:flutter_perpus/modules/navigation/src/navbar_bloc.dart/navbar_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/blocs/profile_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/services/profile_service.dart';
import 'package:flutter_perpus/routes.dart';

import 'modules/auth/src/blocs/auth_bloc.dart';
import 'modules/auth/src/services/auth_service.dart';

void main() {
  final authService = AuthService();
  final profileService = ProfileService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(authService)),
        BlocProvider(
          create: (_) => ProfileBloc(profileService: profileService),
        ),
        BlocProvider(
          create:
              (context) => NavBarBloc(profileBloc: context.read<ProfileBloc>()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      // home: LoginScreen(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
