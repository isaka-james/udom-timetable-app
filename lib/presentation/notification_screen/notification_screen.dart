import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/notification_model.dart';
import 'models/notificationlist_item_model.dart';
import 'provider/notification_provider.dart';
import 'widgets/notificationlist_item_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key})
      : super(
    key: key,
  );

  @override
  NotificationScreenState createState() => NotificationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: NotificationScreen(),
    );
  }
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
            vertical: 17.v,
          ),
          child: Column(
            children: [
              _buildNotificationRow(context),
              SizedBox(height: 32.v),
              _buildNotificationList(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_notifications".tr,
            style: theme.textTheme.headlineSmall,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage14,
            height: 19.v,
            width: 30.h,
            margin: EdgeInsets.only(
              top: 10.v,
              bottom: 8.v,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 12.h),
        child: Consumer<NotificationProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.v,
                );
              },
              itemCount:
              provider.notificationModelObj.notificationlistItemList.length,
              itemBuilder: (context, index) {
                NotificationlistItemModel model = provider
                    .notificationModelObj.notificationlistItemList[index];
                return NotificationlistItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

