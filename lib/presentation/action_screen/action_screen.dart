import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/action_model.dart';
import 'provider/action_provider.dart';
import 'models/action_model.dart';
import 'provider/action_provider.dart';


class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key})
      : super(
    key: key,
  );

  @override
  ActionScreenState createState() => ActionScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActionProvider(),
      child: ActionScreen(),
    );
  }
}

class ActionScreenState extends State<ActionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          children: [
            SizedBox(
              height: 670.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildBackgroundSection(context),
                  _buildCounterSection(context)
                ],
              ),
            ),
            SizedBox(height: 4.v)
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 18.h,
        right: 18.h,
      ),
      padding: EdgeInsets.only(left: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImageRemovebgPreview,
            height: 114.v,
            width: 140.h,
            alignment: Alignment.center,
          ),
          SizedBox(height: 16.v),
          Text(
            "lbl_notify_others".tr,
            style: TextStyle(
            color: Color(0xFFFFFFFF),
              fontSize: 25.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),


    );
  }

  /// Section Widget
  Widget _buildBackgroundSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 32.v),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.customBorderBL44,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              height: 34.v,
              leadingWidth: 60.h,
              leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgImageRemovebgPreview2,
                margin: EdgeInsets.only(left: 20.h),
              ),
            ),
            SizedBox(height: 14.v),
            _buildNotificationSection(context),
            SizedBox(height: 124.v)
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFormSection(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 28.v),
        decoration: AppDecoration.fillOnPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "lbl_cp_221".tr,
              style: CustomTextStyles.titleLargeBlack900Bold,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_help_others_by_giving".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 22.v),
            CustomElevatedButton(
              width: 274.h,
              text: "msg_lecture_in_class".tr,
              margin: EdgeInsets.only(left: 2.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL20,
              buttonTextStyle: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 25.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.v),
            CustomElevatedButton(
              width: 274.h,
              text: "lbl_class_dismissed".tr,
              margin: EdgeInsets.only(left: 2.h),
              buttonStyle: CustomButtonStyles.fillGreen,
              buttonTextStyle: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 25.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40.v)
          ],
        ),
      ),
    );
  }




  /// Section Widget
  Widget _buildCounterSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.h,
        right: 18.h,
      ),
      child: Row(
        children: [_buildFormSection(context)],
      ),
    );
  }
}