import 'package:flutter/material.dart';
import 'package:timetable/presentation/notification_screen/models/notificationlist_item_model.dart';
import '../../../data/database_helper.dart';
import '../models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  late NotificationModel notificationModelObj;

  NotificationProvider() {
    notificationModelObj = NotificationModel();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    List<Map<String, dynamic>> notificationsData =
        await dbHelper.queryAllNotifications();

    // Clear the existing data
    notificationModelObj.notificationlistItemList.clear();

    // Populate the notificationlistItemList with NotificationlistItemModel objects
    for (var entry in notificationsData) {
      notificationModelObj.notificationlistItemList.add(NotificationlistItemModel(
        id: entry['id'],
        //pushed: entry['pushed'],
        //forUser: entry['for'],
        message: entry['message'],
        title: entry['header'],
        coarseShort: entry['coarse_short'],
        date: entry['date'],
      ));
    }

    // Notify listeners that the data has been updated
    notifyListeners();
  }
}