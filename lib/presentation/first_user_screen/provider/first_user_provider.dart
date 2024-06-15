import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/first_user_model.dart';

/// A provider class for the FirstUserScreen.
///
/// This provider manages the state of the FirstUserScreen, including the
/// current firstUserModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FirstUserProvider extends ChangeNotifier {
  FirstUserModel firstUserModelObj = FirstUserModel();

  @override
  void dispose() {
    super.dispose();
  }
}

