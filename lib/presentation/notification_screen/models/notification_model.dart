import '../../../core/app_export.dart';
import 'notificationlist_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationModel {
  List<NotificationlistItemModel> notificationlistItemList = [
    NotificationlistItemModel(
        title: "This is the title of the notification.",
        message:
        "This is the message that should be displayed on the single \nnotification of the use, the message may be longer than \nlike let’s say like 4 to 3 paragraphs.so we’ll enjoy making \nnotification.",
        date: "17th June, 2024"),
    NotificationlistItemModel(
        title: "Test will be next Sunday!.",
        message:
        "This is the message that should be displayed on the single \nnotification of the use, the message may be longer than \nlike let’s say like 4 to 3 paragraphs.so we’ll enjoy making \nnotification.",
        date: "21th June, 2024")
  ];

}

