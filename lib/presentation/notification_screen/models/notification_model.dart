import '../../../core/app_export.dart';
import 'notificationlist_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationModel {
  List<NotificationlistItemModel> notificationlistItemList = [
    NotificationlistItemModel(
        lectureImage: ImageConstant.imgImage15,
        lectureTitle: "Lecture in Class: CP 224",
        lectureStatus: "Lecture is in class now!",
        timeAgo: "21 minutes ago"),
    NotificationlistItemModel(
        lectureImage: ImageConstant.imgDismissImage1,
        lectureTitle: "Class Dismiss: CP 224",
        lectureStatus: "Lecture is dismissed.",
        timeAgo: "2 hours  ago")
  ];
}

