/// This class is used in the [notificationlist_item_widget] screen.

// ignore_for_file: must_be_immutable
class NotificationlistItemModel {
  NotificationlistItemModel({this.title, this.message, this.date, this.id}) {
    title = title ?? "This is the title of the notification.";
    message = message ??
        "This is the message that should be displayed on the single \nnotification of the use, the message may be longer than \nlike let’s say like 4 to 3 paragraphs.so we’ll enjoy making \nnotification.";
    date = date ?? "17th June, 2024";
    id = id ?? "";
  }

  String? title;

  String? message;

  String? date;

  String? id;
}

