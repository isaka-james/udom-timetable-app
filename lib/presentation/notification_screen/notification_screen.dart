import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
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
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.actionScreen,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 18.h,
            vertical: 20.v,
          ),
          child: Column(
            children: [
              _buildNotificationColumn(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_notifications".tr,
        margin: EdgeInsets.only(left: 28.h),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgImage1,
          margin: EdgeInsets.only(
            top: 14.v,
            right: 12.h,
            bottom: 8.v,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }

 /// Section Widget
  Widget _buildNotificationList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.v,
              );
            },
            itemCount: provider.notificationModelObj.notificationlistItemList.length,
            itemBuilder: (context, index) {
              NotificationlistItemModel model =
                  provider.notificationModelObj.notificationlistItemList[index];
              return NotificationlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 2.h),
      child: Column(

        children: [_buildNotificationList(context)],
      ),
    );
  }
}

