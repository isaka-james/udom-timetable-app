import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/comment_model.dart';
import 'provider/comment_provider.dart';

class CommentScreen extends StatefulWidget {
  final int? id;

  const CommentScreen({Key? key, this.id}) : super(key: key);

  @override
  CommentScreenState createState() => CommentScreenState();

  static Widget builder(BuildContext context, {int? id}) {
    return ChangeNotifierProvider(
      create: (context) => CommentProvider(),
      child: CommentScreen(id: id),
    );
  }
}



class CommentScreenState extends State<CommentScreen> {
  int selectedIndex = -1; // Track the selected column index

  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? 0; // Assign a default value if id is null
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 17.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "lbl_feedback".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 49.v),
              CustomImageView(
                imagePath: ImageConstant.imgCoolUiTopLines,
                height: 15.v,
                width: 240.h,
              ),
              SizedBox(height: 60.v),
              _buildRowtheclasswas(context),
              SizedBox(height: 29.v),
              GestureDetector(
                onTap: () {
                  onTapColumnsubmit(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 75.h, right: 79.h),
                  padding: EdgeInsets.symmetric(horizontal: 55.h, vertical: 14.v),
                  decoration: AppDecoration.fillRed700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_submit".tr,
                        style: theme.textTheme.headlineLarge,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.v),
              CustomImageView(
                imagePath: ImageConstant.imgCoolUiBottom,
                height: 367.v,
                width: 365.h,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowtheclasswas(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSelectableColumn(context, 0, "msg_the_class_was_dismissed".tr, "lbl_dismissed".tr),
          _buildSelectableColumn(context, 1, "msg_lecture_is_in_class".tr, "lbl_started".tr),
        ],
      ),
    );
  }

  Widget _buildSelectableColumn(BuildContext context, int index, String lectureText, String dismissedText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = selectedIndex == index ? -1 : index; // Toggle selection
        });
      },
      child: Column(
        children: [
          Container(
            height: 100.v,
            width: 179.h,
            padding: EdgeInsets.symmetric(horizontal: 51.h),
            decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.white : null, // Change background color based on selection
              borderRadius: BorderRadiusStyle.customBorderTL20,
            ),
            child: CustomImageView(
              imagePath: index == 0 ? ImageConstant.imageDismissed : ImageConstant.imgImage13,
              height: 76.v,
              width: 77.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 1.v),
            ),
          ),
          SizedBox(height: 1.v),
          _buildStacktheclasswa(context, lectureText: lectureText, dismissedText: dismissedText, isSelected: selectedIndex == index)
        ],
      ),
    );
  }

  Widget _buildStacktheclasswa(BuildContext context, {required String lectureText, required String dismissedText, required bool isSelected}) {
    return SizedBox(
      height: 83.v,
      width: 179.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 28.v),
              decoration: BoxDecoration(
                color:  null, // Change color based on selection with opacity
                borderRadius: BorderRadius.circular(15.h),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lectureText,
                    style: CustomTextStyles.bodySmallLight_1.copyWith(color: appTheme.black900),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 38.h),
              child: Text(
                dismissedText,
                style: CustomTextStyles.headlineSmallBlack900.copyWith(color: appTheme.black900),
              ),
            ),
          )
        ],
      ),
    );
  }

  onTapColumnsubmit(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.homeScreen);
  }
}
