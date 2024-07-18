import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/first_user_screen/first_user_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/notification_screen/notification_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';
import '../presentation/action_screen/action_screen.dart';

class ActionScreenArguments {
  final int id;

  ActionScreenArguments(this.id);
}

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String firstUserScreen = '/first_user_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String homeScreen = '/home_screen';

  static const String actionScreen = '/action_screen';

  static const String notificationScreen = '/notification_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    firstUserScreen: FirstUserScreen.builder,
    welcomeScreen: WelcomeScreen.builder,
    homeScreen: HomeScreen.builder,
    actionScreen: (context) => ActionScreen(),
    notificationScreen: NotificationScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: SplashScreen.builder
  };
}

