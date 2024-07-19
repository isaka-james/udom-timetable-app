import 'package:flutter/material.dart';
import 'package:timetable/data/database_helper.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
// import 'models/action_model.dart';
import 'provider/action_provider.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  ActionScreenState createState() => ActionScreenState();

  static Widget builder(BuildContext context, int passedInteger) {
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
    final int timetableId = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            SizedBox(
              height: 670.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildBackgroundSection(context),
                  _buildCounterSection(context, timetableId),
                ],
              ),
            ),
            SizedBox(height: 4.v),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      padding: EdgeInsets.only(left: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImageSettingTime,
            height: 114.v,
            width: 140.h,
            alignment: Alignment.center,
          ),
          SizedBox(height: 16.v),
          Text(
            "lbl_notify_others".tr,
            style: TextStyle(
              color: const Color(0xFFFFFFFF),
              fontSize: 25.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

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
              leading: InkWell(
                onTap: () {
                  debugPrint("clicked back button");
                  Navigator.pop(context);
                },
                child: AppbarLeadingImage(
                  imagePath: ImageConstant.imgImageBackArrow,
                  margin: EdgeInsets.only(left: 20.h),
                ),
              ),
            ),
            SizedBox(height: 14.v),
            _buildNotificationSection(context),
            SizedBox(height: 124.v),
          ],
        ),
      ),
    );
  }

  Future<Widget> _buildFormSection(BuildContext context, int id) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Map<String, dynamic> timetableData = await dbHelper.queryTimetableForId(id);
    String coarseShort = timetableData['coarse_short'] ?? 'N/A';

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 28.v),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            coarseShort,
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
              color: const Color(0xFFFFFFFF),
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
              color: const Color(0xFFFFFFFF),
              fontSize: 25.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.v),
        ],
      ),
    );
  }

  Widget _buildCounterSection(BuildContext context, int id) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: FutureBuilder<Widget>(
        future: _buildFormSection(context, id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
