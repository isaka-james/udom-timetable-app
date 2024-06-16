import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
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
    return _buildNotificationItem(context);
  }

  /// Section Widget
  Widget _buildNotificationItem(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.v),
          CustomElevatedNotification(
            height: 28.v,
            width: 96.h,
            text: "lbl_cp_222".tr,

          ),

          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              notificationlistItemModelObj.title!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              notificationlistItemModelObj.message!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: Text(
                notificationlistItemModelObj.date!,
                style: theme.textTheme.labelMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}

