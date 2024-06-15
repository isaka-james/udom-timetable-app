import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';
import '../../../data/database_helper.dart';

/// A provider class for the HomeScreen.
///
/// This provider manages the state of the HomeScreen, including the
/// current homeModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();


  // Add a method to update the selected date
  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    print("hello from updateSelectedDate");
    notifyListeners();  // Notify listeners about the change
  }



  // selectedDate not null
  DateTime _selectedDate = DateTime.now();
  List<Map<String, String?>> _timetableData = [];

  DateTime get selectedDate => _selectedDate;
  List<Map<String, String?>> get timetableData => _timetableData;

  set selectedDate(DateTime date) {
    _selectedDate = date;
    print("about to notify from selectedDate, the date is ");
    print(date);
    notifyListeners();
    fetchTimetableForDate(date);
  }

  Future<void> fetchTimetableForDate(DateTime date) async {
    _timetableData = await DatabaseHelper.instance.queryTimetableForDate(date);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

}

