import 'package:flutter/material.dart';
import 'package:flutter_perpus/modules/auth/src/screens/login_screen.dart';
import 'package:flutter_perpus/modules/auth/src/screens/splash_screen.dart';
import 'package:flutter_perpus/modules/home/src/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};