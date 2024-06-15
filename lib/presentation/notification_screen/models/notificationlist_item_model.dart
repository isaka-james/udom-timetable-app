import '../../../core/app_export.dart';

/// This class is used in the [notificationlist_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationlistItemModel {
  NotificationlistItemModel(
      {this.lectureImage,
        this.lectureTitle,
        this.lectureStatus,
        this.timeAgo,
        this.id}) {
    lectureImage = lectureImage ?? ImageConstant.imgImage15;
    lectureTitle = lectureTitle ?? "Lecture in Class: CP 224";
    lectureStatus = lectureStatus ?? "Lecture is in class now!";
    timeAgo = timeAgo ?? "21 minutes ago";
    id = id ?? "";
  }

  String? lectureImage;

  String? lectureTitle;

  String? lectureStatus;

  String? timeAgo;

  String? id;
}

