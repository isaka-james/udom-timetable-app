import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/action_model.dart';

/// A provider class for the ActionScreen.
///
/// This provider manages the state of the ActionScreen, including the
/// current actionModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ActionProvider extends ChangeNotifier {
  ActionModel actionModelObj = ActionModel();

  @override
  void dispose() {
    super.dispose();
  }
}

