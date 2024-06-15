import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/notificationlist_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationlistItemWidget extends StatelessWidget {
  NotificationlistItemWidget(this.notificationlistItemModelObj, {Key? key})
      : super(
    key: key,
  );

  NotificationlistItemModel notificationlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 104.v,
          width: 105.h,
          margin: EdgeInsets.only(bottom: 1.v),
          padding: EdgeInsets.symmetric(
            horizontal: 1.h,
            vertical: 13.v,
          ),
          decoration: AppDecoration.fillOnPrimary,
          child: CustomImageView(
            imagePath: notificationlistItemModelObj.lectureImage!,
            height: 77.adaptSize,
            width: 77.adaptSize,
            alignment: Alignment.centerRight,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillOnPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  notificationlistItemModelObj.lectureTitle!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    notificationlistItemModelObj.lectureStatus!,
                    style: CustomTextStyles.bodySmallLight,
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    notificationlistItemModelObj.timeAgo!,
                    style: CustomTextStyles.bodySmallLight,
                  ),
                ),
                SizedBox(height: 2.v)
              ],
            ),
          ),
        )
      ],
    );
  }
}

