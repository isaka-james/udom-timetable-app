/// This class is used in the [notificationlist_item_widget] screen.

// ignore_for_file: must_be_immutable
class NotificationlistItemModel {
  NotificationlistItemModel(
      {this.title, this.message, this.date, required this.id, required this.coarseShort}) {
    title = title ?? "No Title.";
    message = message ?? "No \n Message \n Currently.";
    date = date ?? "--";
    id = id;
    coarseShort = coarseShort?? "--";
  }

  String? title;

  String? message;

  String? date;

  int id;

  String? coarseShort;
}
