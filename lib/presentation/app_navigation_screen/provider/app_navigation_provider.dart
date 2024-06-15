import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/app_navigation_model.dart';

/// A provider class for the AppNavigationScreen.
///
/// This provider manages the state of the AppNavigationScreen, including the
/// current appNavigationModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppNavigationProvider extends ChangeNotifier {
  AppNavigationModel appNavigationModelObj = AppNavigationModel();

  @override
  void dispose() {
    super.dispose();
  }
}

